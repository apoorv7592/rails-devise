json.array!(@companies) do |company|
  json.extract! company, :id, :name, :contact, :address
  json.url company_url(company, format: :json)
end
