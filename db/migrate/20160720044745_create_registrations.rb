class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :user_id
      t.string :registration_id
      t.string :device_name
      t.timestamps null: false
    end
  end
end
