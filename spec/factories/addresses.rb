# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  first_name :string(100)
#  last_name  :string(100)
#  pincode    :integer
#  landmark   :text
#  address    :text
#  mobile     :string(15)
#  status     :integer          default(1)
#  city       :string
#  state      :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :address do
    user_id 1
    first_name "MyString"
    last_name "MyString"
    address "MyText"
    landmark "MyText"
    mobile "MyString"
    pincode 1
    status 1
    city "MyString"
    state "MyString"
    country "MyString"
  end
end
