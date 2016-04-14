class AddColumnsToProductSizes < ActiveRecord::Migration
  def change
  	add_column :product_sizes, :weight, :integer
  	add_column :product_sizes, :mrp, :integer
  	add_column :product_sizes, :price, :integer
  end
end
