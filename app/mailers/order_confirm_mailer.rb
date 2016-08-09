class OrderConfirmMailer < ApplicationMailer
include Resque::Mailer
  default from: "contact@jmedss.com"

  def order_placed(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: "Your order #{@order.id} is successfully placed.")
  end

  def order_confirm(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Your order #{@order.id} is confirmed')
  end

  def order_onhold(order_id)
    @order = Order.find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Order no. #{@order.id} has been put on hold by our Partner Retailer')
  end

  # def order_packed(order_id)
  #   @order = Order.includes(:user, order_products: :product_size).find(order_id)
  #   @email = @order.user.email
  #   mail(to: @email, subject: 'Your order #{@order.id} is packed.')
  # end

  def order_shipped(order_id)
    @order = Order.includes(:user, order_products: :product_size).find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Your order #{@order.id} is out for delivery')
  end

  def order_delivered(order_id)
    @order = Order.find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Your order #{@order.id} has been delivered.')
  end
  
  def order_cancelled(order_id)
    @order = Order.find(order_id)
    @email = @order.user.email
    mail(to: @email, subject: 'Order no. #{@order.id} has been cancelled by you.')
  end

end
