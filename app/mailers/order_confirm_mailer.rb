class OrderConfirmMailer < ApplicationMailer
include Resque::Mailer
  default from: "contact@jmedss.com"

  def order_placed(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: "Order is succesfully placed, your Order ID is #{@order.id}")
  end

  def order_confirm(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Order #{@order.id} is Confirmed')
  end

  def order_packed(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Order  #{@order.id} is Packed')
  end

  def order_shipped(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Order  #{@order.id} is Shipped')
  end

  def order_delivered(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Order #{@order.id} is Delivered')
  end
  
  def order_cancelled(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Order  #{@order.id} is Cancelled')
  end

end
