json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :url, :meta_title,:meta_description,:meta_keywords,:company_id,:price,:mrp,:weight,:rank,:status
  json.url product_url(product, format: :json)
    json.sizes do |json|
      json.array! product.product_sizes do |product_size|
        if product_size.status=="enabled"
          json.size product_size.size
          json.product_size_id product_size.id
          json.extract! product_size, :qty_avail, :size_unit
        end
      end
    end 
end
