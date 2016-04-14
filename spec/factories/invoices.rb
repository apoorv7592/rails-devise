FactoryGirl.define do
  factory :invoice do
    order_id 1
    invoice_note "MyText"
    admin_user_id 1
    invoice_date "2016-04-13 10:55:28"
  end
end
