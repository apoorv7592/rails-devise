class RemoveColumnsFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :weight, :integer
  	remove_column :products, :mrp, :integer
  	remove_column :products, :price, :integer
  end
end
