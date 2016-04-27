json.extract! @product, :id, :created_at, :updated_at, :name, :description, :url, :meta_title,:meta_description,:meta_keywords,:company_id,:rank,:status
json.images do |json|
  json.array! @product.images do |product_image|
	  json.square "https://s3.amazonaws.com/appy-development/products/#{product_image.id}/square/#{product_image.image_file_name}" if @product.images.present?

	  json.thumb "https://s3.amazonaws.com/appy-development/products/#{product_image.id}/thumb/#{product_image.image_file_name}" if @product.images.present?
  end
end

    json.sizes do |json|
      json.array! @product.product_sizes do |product_size|
        if product_size.status=="enabled"
          json.size product_size.size
          json.product_size_id product_size.id
          json.extract! product_size, :qty_avail, :size_unit, :price, :mrp, :weight
        end
      end
    end