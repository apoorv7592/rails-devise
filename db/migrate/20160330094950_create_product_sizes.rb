class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
		t.integer :product_id, null:false
		t.string :size, null:false
		t.integer :qty_avail, default:0 # TO display to user
		t.integer :size_unit, limit:1, default:0 
		t.integer :status, limit:1, default:0
		t.timestamps null: false
    end
  end
end
