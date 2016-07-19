class CreateOrderDeductions < ActiveRecord::Migration
  def change
    create_table :order_deductions do |t|
      t.integer :order_id, index: true
      t.integer :coupon_id, index: true
      t.float :total_amount 
      t.float :total_discount 
      t.timestamps null: false
    end
  end
end
