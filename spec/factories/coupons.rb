# == Schema Information
#
# Table name: coupons
#
#  id                 :integer          not null, primary key
#  code               :string
#  valid_product      :text
#  valid_category     :text
#  valid_company      :text
#  valid_city         :text
#  value              :integer
#  value_type         :integer
#  qualifying_amount  :integer
#  max_discount       :integer
#  max_usage          :integer
#  max_usage_per_user :integer
#  expire_date        :datetime
#  start_date         :datetime
#  success_message    :string
#  coupon_message     :string
#  status             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :coupon do
    code "MyString"
    valid_product "MyText"
    valid_category "MyText"
    valid_company "MyText"
    valid_city "MyText"
    value 1
    value_type 1
    qualifying_amount 1
    max_discount 1
    max_usage 1
    max_usage_per_user 1
    expire_date "2016-04-04 18:32:47"
    start_date "2016-04-04 18:32:47"
    success_message "MyString"
    coupon_message "MyString"
    status 1
  end
end
