# == Schema Information
#
# Table name: invoices
#
#  id            :integer          not null, primary key
#  order_id      :integer
#  invoice_note  :text
#  admin_user_id :integer
#  invoice_date  :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
