json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :status, :url_string, :seo_title, :seo_meta
  json.url category_url(category, format: :json)
end
