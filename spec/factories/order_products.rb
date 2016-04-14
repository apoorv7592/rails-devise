# == Schema Information
#
# Table name: order_products
#
#  id              :integer          not null, primary key
#  order_id        :integer
#  product_size_id :integer
#  quantity        :integer
#  price           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :order_product do
    
  end
end
