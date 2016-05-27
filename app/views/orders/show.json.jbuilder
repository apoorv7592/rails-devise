json.extract! @order, :id, :address_id, :user_id, :cod_money, :shipping_money, :status, :is_confirm, :payment_gateway, :admin_user_id, :invoice_id, :note, :created_at, :updated_at

json.address do |json|
  json.extract! @order.address, :id, :first_name, :last_name, :pincode, :landmark, :address, :mobile, :city, :state, :country
end

json.user do |json|
  json.extract! @order.user, :id, :name, :email, :phone
end

json.products do |json|
  json.array! @order_products do |op|
     json.product_size_id op.product_size_id
     json.quantity op.quantity
      if op.product_size.present?
	     json.product_id op.product_size.product.id
	  	 json.product_name op.product_size.product.name
	  	 json.company_name op.product_size.product.company.name
	  	 json.size op.product_size.size
	  	 json.unit op.product_size.size_unit
	  	 json.price op.product_size.price
	  	 json.mrp op.product_size.mrp
		 json.images do |json|
			  json.square "https://s3.amazonaws.com/appy-development/products/#{op.product_size.product.images.first.id}/square/#{op.product_size.product.images.first.image_file_name}" if op.product_size.product.images.first.present?

			  json.thumb "https://s3.amazonaws.com/appy-development/products/#{op.product_size.product.images.first.id}/thumb/#{op.product_size.product.images.first.image_file_name}" if op.product_size.product.images.first.present?
		 end
	  end
  end
end


json.process do |json|
  json.extract! @order.order_process, :barcode, :courier_id, :rto_reason, :rto_date, :shipping_date, :packing_date, :delivered_date, :rto_date if @order.order_process.present?
end