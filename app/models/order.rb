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
    after_save :order_confirm, if: lambda {|order| order.status == "order_placed" and order.is_confirm_changed? and order.is_confirm_was == "not confirm" and order.is_confirm == "confirm" }
    after_save :order_placed, if: lambda {|order| order.status_changed? and order.status_was == nil and order.status == "order_placed" }
    after_save :order_packed, if: lambda {|order| order.status_changed? and order.status_was == "order_placed" and order.status == "packed" }
    after_save :order_shipped, if: lambda {|order| order.status_changed? and order.status_was == "packed" and order.status == "shipped" }
    after_save :order_delivered, if: lambda {|order| order.status_changed? and order.status_was == "shipped" and order.status == "delivered" }
    after_save :order_cancelled, if: lambda {|order| order.status_changed? and order.status_was == "delivered" and order.status == "cancelled" }
    accepts_nested_attributes_for :order_products, allow_destroy: true

	enum status: [:order_placed, :failed, :under_packing, :packed, :shipped, :cancelled, :rto, :delivered]
	enum payment_gateway: [:cod, :prepaid]
	enum is_confirm: ["not confirm", :confirm]

    def order_confirm
      OrderConfirmMailer.order_confirm(self).deliver
    end

    def order_placed
      OrderConfirmMailer.order_placed(self).deliver
    end

    def order_packed
      packdate = OrderProcess.find_or_create_by(order_id: self.id)
      packdate.packing_date = Time.now        
      packdate.save
      OrderConfirmMailer.order_packed(self).deliver
    end
    
    def order_shipped
      packdate = OrderProcess.find_by(order_id: self.id)
      packdate.shipping_date = Time.now        
      packdate.save
      OrderConfirmMailer.order_shipped(self).deliver 
    end

    def order_delivered
      packdate = OrderProcess.find_by(order_id: self.id)
      packdate.delivered_date = Time.now        
      pckdate.save
      OrderConfirmMailer.order_delivered(self).deliver
    end    

    def order_cancelled
      OrderConfirmMailer.order_cancelled(self).deliver
    end

    def amount
      @amount = self.order_products.inject(0) {|total_amount,order_product| total_amount += (order_product.price * order_product.quantity)}
    end

    def total_quantity
      @total_quantity = @total_quantity || (self.order_products.inject(0) {|total_quantity, order_product| total_quantity += order_product.quantity} || 0)
    end

    def discount_amount
      @discount_amount = self.order_products.inject(0) {|discount_amount,order_product| discount_amount += order_product.discount}
    end

    def final_amount
      @final_amount = amount - discount_amount
    end

    def set_price
      product_size_id_list =  self.order_products.map {|order_product|  order_product.product_size_id}
      product_sizes_hash = ProductSize.includes(:product).where(id: product_size_id_list).index_by(&:id)
      self.order_products.map {|order_product|  order_product.price =  product_sizes_hash[order_product.product_size_id].price}
    end

    def set_discount
      binding.pry
      coupon = Coupon.where(code:coupon_code).first if Coupon.where(code:coupon_code).present?
      if (self.amount >= coupon.qualifying_amount) and (coupon.expire_date > Date.today) and (coupon.start_date  < Date.today + 1.day)  and (coupon.status == "enabled")
        @total_discount_value = coupon.value_type=="percentage" ? (coupon.value * amount * 0.01) : coupon.value
        @discount_amount = @total_discount_value > coupon.max_discount ? coupon.max_discount : @total_discount_value
      else
        @discount_amount = 0
      end
      self.order_products.each do |order_product|
         order_product.discount = (@discount == 0) ? 0 : (order_product.price * order_product.quantity * @discount_amount)/amount
         order_product.save
      end
    end
end
