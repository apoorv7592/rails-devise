class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id, index: true
      t.integer :status, limit:1, default: 1, comment: "0=>disabled 1=>enabled 2=>default"
      t.integer :product_size_id, index: true
      t.integer :quantity
      t.string :coupon
      t.timestamps null: false
    end
  end
end
