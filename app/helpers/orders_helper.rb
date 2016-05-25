# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  address_id      :integer
#  user_id         :integer
#  cod_money       :integer
#  shipping_money  :integer
#  status          :integer          default(0)
#  is_confirm      :integer          default(0)
#  payment_gateway :integer
#  admin_user_id   :integer
#  invoice_id      :integer
#  note            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module OrdersHelper
end
