# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  address_id      :integer
#  user_id         :integer
#  cod_money       :integer
#  shipping_money  :integer
#  status          :integer          default(0)
#  is_confirm      :integer          default(0)
#  payment_gateway :integer
#  admin_user_id   :integer
#  invoice_id      :integer
#  note            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Order < ActiveRecord::Base

    has_many :order_products, dependent: :destroy
    has_many :product_sizes, through: :order_products
    has_one :order_process
    belongs_to :user
    belongs_to :address
    attr_accessor :coupon_code
    before_validation :set_price, on: :create
    after_create :set_discount
    after_save :order_confirm, if: lambda {|order| order.status_changed? and order.status_was == "order_placed" and order.status == "confirmed" }
    after_save :order_onhold, if: lambda {|order| order.status_changed? and order.status == "on_hold" }
    after_create :order_placed #, if: lambda {|order| order.status_changed? and  order.status == "order_placed" }
    after_save :order_packed, if: lambda {|order| order.status_changed? and order.status_was == "confirmed" and order.status == "packed" }
    after_save :order_shipped, if: lambda {|order| order.status_changed? and order.status_was == "packed" and order.status == "shipped" }
    after_save :order_delivered, if: lambda {|order| order.status_changed? and order.status_was == "shipped" and order.status == "delivered" }
    after_save :order_cancelled, if: lambda {|order| order.status_changed? and order.status == "cancelled" }
    accepts_nested_attributes_for :order_products, allow_destroy: true

	enum status: [:order_placed, :confirmed, :on_hold, :packed, :shipped, :cancelled, :rto, :delivered]
	enum payment_gateway: [:cod, :prepaid]

    def order_confirm
      OrderConfirmMailer.order_confirm(self.id).deliver
    end

    def order_placed
      OrderConfirmMailer.order_placed(self.id).deliver
    end

    def order_onhold
      OrderConfirmMailer.order_onhold(self.id).deliver
    end

    def order_packed
      packdate = OrderProcess.find_or_create_by(order_id: self.id)
      packdate.packing_date = Time.now        
      packdate.save
      #OrderConfirmMailer.order_packed(self.id).deliver
    end
    
    def order_shipped
      packdate = OrderProcess.find_by(order_id: self.id)
      packdate.shipping_date = Time.now        
      packdate.save
      OrderConfirmMailer.order_shipped(self.id).deliver 
    end

    def order_delivered
      packdate = OrderProcess.find_by(order_id: self.id)
      packdate.delivered_date = Time.now        
      packdate.save
      OrderConfirmMailer.order_delivered(self.id).deliver
    end    

    def order_cancelled
      OrderConfirmMailer.order_cancelled(self.id).deliver
    end

    def amount
      @amount = (self.order_products.inject(0) {|total_amount,order_product| total_amount += (order_product.price * order_product.quantity)}).to_i
    end

    def total_quantity
      @total_quantity = @total_quantity || (self.order_products.inject(0) {|total_quantity, order_product| total_quantity += order_product.quantity} || 0)
    end

    def discount_amount
      @discount_amount = (self.order_products.inject(0) {|discount_amount,order_product| discount_amount += order_product.discount}).to_i
    end

    def amount_before_shipping
      @amount_before_shipping = amount.to_i - discount_amount.to_i
    end

    def shipping_charge
      @shipping_charge = (amount_before_shipping > 100) ? 0 : 40
    end

    def final_amount
      @final_amount = amount.to_i - discount_amount.to_i + shipping_charge.to_i
    end

    def set_price
      product_size_id_list =  self.order_products.map {|order_product|  order_product.product_size_id}
      product_sizes_hash = ProductSize.includes(:product).where(id: product_size_id_list).index_by(&:id)
      self.order_products.map {|order_product|  order_product.price =  product_sizes_hash[order_product.product_size_id].price}
    end

    def set_discount
      if Coupon.find_by(code:coupon_code).present?
        coupon = Coupon.find_by(code:coupon_code)
        if (self.amount >= coupon.qualifying_amount) and (coupon.expire_date > Date.today) and (coupon.start_date  < Date.today + 1.day)  and (coupon.status == "enabled")
          @total_discount_value = coupon.value_type=="percentage" ? (coupon.value * amount * 0.01) : coupon.value
          @discount_amount = @total_discount_value > coupon.max_discount ? coupon.max_discount : @total_discount_value
        else
          @discount_amount = 0
        end
      else
        @discount_amount = 0
      end
      self.order_products.each do |order_product|
         order_product.discount = (@discount_amount == 0) ? 0 : (order_product.price * order_product.quantity * @discount_amount)/amount
         order_product.save
      end
    end

    def prescription_to_json
     JSON.parse self.prescription.gsub('=>', ':') if self.prescription.present?
    end

    def deliver_time_to_json
      JSON.parse self.deliver_time.gsub('=>', ':')   if self.deliver_time.present?
    end
end
