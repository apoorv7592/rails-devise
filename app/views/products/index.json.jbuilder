json.product do |json|
  json.array!(@products) do |product|
    json.extract! product, :id, :name, :description,:status
    json.url product_url(product, format: :json)
    json.company product.company.name
    json.image_link "https://s3.amazonaws.com/appy-development/products/#{product.images[0].id}/thumb/#{product.images[0].image_file_name}" if product.images.present?
      json.sizes do |json|
        json.array! product.product_sizes do |product_size|
          if product_size.status=="enabled"
            json.size product_size.size
            json.product_size_id product_size.id
            json.extract! product_size, :qty_avail, :size_unit, :price, :mrp, :weight
          end
        end
      end 
  end
end