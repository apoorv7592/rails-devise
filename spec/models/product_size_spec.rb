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

require 'rails_helper'

RSpec.describe ProductSize, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
