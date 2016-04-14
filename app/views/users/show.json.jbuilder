json.extract! @user, :id, :name, :email, :password, :phone, :created_at, :updated_at


json.addresses do |json|
  json.array! @user.addresses do |address|
  	json.merge! address.attributes
  end
end