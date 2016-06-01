json.extract! @user, :id, :name, :email, :phone, :created_at, :updated_at


json.addresses do |json|
  json.array! @user.addresses do |address|
  	json.merge! address.attributes
  end
end

json.orders do |json|
	json.array!(@orders) do |order|
		json.extract! order, :id, :status, :created_at
		json.products do |json|
			json.array! order.order_products do |op|
				json.product_size_id op.product_size_id
				json.quantity op.quantity
				if op.product_size.present?
					json.product_id op.product_size.product.id
					json.product_name op.product_size.product.name
					json.company_name op.product_size.product.company.name
					json.size op.product_size.size
					json.unit op.product_size.size_unit
					json.images do |json|
						json.thumb "https://s3.amazonaws.com/appy-development/products/#{op.product_size.product.images.first.id}/thumb/#{op.product_size.product.images.first.image_file_name}" if op.product_size.product.images.first.present?
					end
				end
			end
		end
	end
end