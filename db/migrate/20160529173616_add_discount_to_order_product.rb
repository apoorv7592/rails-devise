class AddDiscountToOrderProduct < ActiveRecord::Migration
  def change
  	add_column :order_products, :discount, :float
  end
end
