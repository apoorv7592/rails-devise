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

FactoryGirl.define do
  factory :invoice do
    order_id 1
    invoice_note "MyText"
    admin_user_id 1
    invoice_date "2016-04-13 10:55:28"
  end
end
