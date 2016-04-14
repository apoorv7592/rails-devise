json.array!(@addresses) do |address|
  json.extract! address, :id, :user_id, :first_name, :last_name, :address, :landmark, :mobile, :pincode, :status, :city, :state, :country
  json.url address_url(address, format: :json)
end
