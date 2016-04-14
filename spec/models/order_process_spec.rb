# == Schema Information
#
# Table name: order_processes
#
#  id             :integer          not null, primary key
#  order_id       :integer
#  barcode        :string(50)
#  courier_id     :integer
#  rto_reason     :text
#  packing_date   :datetime
#  shipping_date  :datetime
#  delivered_date :datetime
#  rto_date       :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe OrderProcess, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
