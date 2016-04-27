class OrderConfirmMailer < ApplicationMailer

  default from: "from@example.com"

  def order_placed(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order is Succesfully Placed')
  end

  def order_confirm(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order is Confirmed')
  end

  def order_packed(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order is Packed')
  end

  def order_shipped(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order is Shipped')
  end

  def order_delivered(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order is Delivered')
  end
  
  def order_cancelled(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order is Cancelled')
  end

end
