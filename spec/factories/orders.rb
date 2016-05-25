# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  address_id      :integer
#  user_id         :integer
#  cod_money       :integer
#  shipping_money  :integer
#  status          :integer          default(0)
#  is_confirm      :integer          default(0)
#  payment_gateway :integer
#  admin_user_id   :integer
#  invoice_id      :integer
#  note            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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
