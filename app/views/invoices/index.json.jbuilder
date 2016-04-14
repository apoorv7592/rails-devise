json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :order_id, :invoice_note, :admin_user_id, :invoice_date
  json.url invoice_url(invoice, format: :json)
end
