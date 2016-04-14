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

class Order < ActiveRecord::Base

    has_many :order_products, dependent: :destroy
    has_many :product_sizes, through: :order_products
    has_one :order_process
    belongs_to :user

    accepts_nested_attributes_for :order_products, allow_destroy: true

	enum status: [:order_placed, :failed]
	enum payment_gateway: [:cod, :prepaid]
end
