# == Schema Information
#
# Table name: product_sizes
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  size       :string           not null
#  qty_avail  :integer          default(0)
#  size_unit  :integer          default(0)
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  weight     :integer
#  mrp        :integer
#  price      :integer
#

FactoryGirl.define do
  factory :product_size do
    
  end
end
