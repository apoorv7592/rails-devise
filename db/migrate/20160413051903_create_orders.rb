class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :address_id
      t.integer :user_id, index: true
      t.integer :cod_money
      t.integer :shipping_money
      t.integer :status, index: true
      t.integer :is_confirm, index: true
      t.integer :payment_gateway
      t.integer :admin_user_id
      t.integer :invoice_id
      t.text :note

      t.timestamps null: false
    end
  end
end
