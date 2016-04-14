class CreateOrderProcesses < ActiveRecord::Migration
  def change
    create_table :order_processes do |t|
    	t.integer :order_id , index: :true
    	t.string :barcode , limit:50, index: true
    	t.integer :courier_id, index: true
      t.text :rto_reason
    	t.datetime :packing_date, index: true
    	t.datetime :shipping_date, index: true
    	t.datetime :delivered_date
      t.datetime :rto_date, index: true
      t.timestamps null: false
    end
  end
end
