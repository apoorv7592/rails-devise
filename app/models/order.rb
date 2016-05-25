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
      packdate.save
      OrderConfirmMailer.order_delivered(self).deliver
    end    

    def order_cancelled
      OrderConfirmMailer.order_cancelled(self).deliver
    end
end
