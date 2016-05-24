json.home_banner do |json|
	json.array!(@banner) do |home|
	  json.extract! home, :id, :banner_name, :path, :classified_as, :rank
	  json.image_url "https://s3.amazonaws.com/appy-development/home/#{home.images[0].id}/thumb/#{home.images[0].image_file_name}" if home.images.present?
	end
end

json.offers do |json|
	json.array!(@offer) do |home|
	  json.extract! home, :id, :banner_name, :path, :classified_as, :rank
	  json.image_url "https://s3.amazonaws.com/appy-development/home/#{home.images[0].id}/thumb/#{home.images[0].image_file_name}" if home.images.present?
	end
end

json.top_trending_products do |json|
  json.array!(@top_trend) do |product|
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

json.popular_products do |json|
  json.array!(@popular) do |product|
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

