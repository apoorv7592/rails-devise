# == Schema Information
#
# Table name: carts
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  status          :integer          default(1)
#  product_size_id :integer
#  quantity        :integer
#  coupon          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :cart do
    
  end
end
