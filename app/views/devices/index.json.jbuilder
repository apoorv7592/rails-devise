json.array!(@devices) do |device|
  json.extract! device, :id, :id, :user_id, :token, :enabled, :platform
  json.url device_url(device, format: :json)
end
