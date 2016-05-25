json.extract! @order, :id, :address_id, :user_id, :cod_money, :shipping_money, :status, :is_confirm, :payment_gateway, :admin_user_id, :invoice_id, :note, :created_at, :updated_at

json.address do |json|
  json.extract! @order.address, :id, :first_name, :last_name, :pincode, :landmark, :address, :mobile, :city, :state, :country
end

json.user do |json|
  json.extract! @order.user, :id, :name, :email, :phone
end

json.products do |json|
  json.array! @sizes do |size|
  	 json.product_name size.product.name
  	 json.size size.size
  	 json.unit size.size_unit
     json.quantity @order.order_products.where(product_size_id:size.id).pluck(:quantity).join(',').to_i  
  end
end


json.process do |json|
  json.extract! @order.order_process, :barcode, :courier_id, :rto_reason, :rto_date, :shipping_date, :packing_date, :delivered_date, :rto_date if @order.order_process.present?
end