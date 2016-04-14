class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :order_id, index: true
      t.integer :product_size_id, index: true
      t.integer :quantity
      t.float :price #price of one
      t.timestamps null: false
    end
  end
end
