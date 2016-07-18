class AddPrescriptionDetailsStartEndTimeToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :deliver_time, :text
  	add_column :orders, :prescription, :text
  end
end
