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

class OrderProduct < ActiveRecord::Base

  belongs_to :order
  belongs_to :product_size

   
end
