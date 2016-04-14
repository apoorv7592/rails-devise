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

require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
