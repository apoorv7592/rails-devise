FactoryGirl.define do
  factory :order do
    address_id 1
    user_id 1
    cod_money 1
    shipping_money 1
    status 1
    is_confirm 1
    payment_gateway 1
    admin_user_id 1
    invoice_id 1
    note "MyText"
  end
end
