class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id, index: true
      t.string :first_name, limit: 100, index: true
      t.string :last_name, limit: 100, index: true
      t.integer :pincode,index: true
      t.text :landmark
      t.text :address
      t.string :mobile, limit:15
      t.integer :status, limit:1, default: 1, comment: "0=>disabled 1=>enabled 2=>default"
      t.string :city, index: true
      t.string :state, index: true
      t.string :country, index: true
      t.timestamps null: false
    end
  end
end
