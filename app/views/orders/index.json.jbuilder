json.array!(@orders) do |order|
  json.extract! order, :id, :address_id, :user_id, :cod_money, :shipping_money, :status, :is_confirm, :payment_gateway, :admin_user_id, :invoice_id, :note
  json.url order_url(order, format: :json)
end


