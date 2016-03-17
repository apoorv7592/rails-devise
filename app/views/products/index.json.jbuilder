json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :url, :meta_title,:meta_description,:meta_keywords,:company_id,:price,:mrp,:weight,:rank,:status
  json.url product_url(product, format: :json)
end
