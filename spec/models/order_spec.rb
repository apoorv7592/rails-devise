# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  address_id      :integer
#  user_id         :integer
#  cod_money       :integer
#  shipping_money  :integer
#  status          :integer
#  is_confirm      :integer
#  payment_gateway :integer
#  admin_user_id   :integer
#  invoice_id      :integer
#  note            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
