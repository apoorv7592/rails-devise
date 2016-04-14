class Order < ActiveRecord::Base

    has_many :order_products, dependent: :destroy
    has_many :product_sizes, through: :order_products
    has_one :order_process
    belongs_to :user

    accepts_nested_attributes_for :order_products, allow_destroy: true

	enum status: [:order_placed, :failed]
	enum payment_gateway: [:cod, :prepaid]
end
