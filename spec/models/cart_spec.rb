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

require 'rails_helper'

RSpec.describe Cart, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
