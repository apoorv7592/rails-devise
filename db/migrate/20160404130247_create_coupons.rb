class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.text :valid_product
      t.text :valid_category
      t.text :valid_company
      t.text :valid_city
      t.integer :value
      t.integer :value_type
      t.integer :qualifying_amount
      t.integer :max_discount
      t.integer :max_usage
      t.integer :max_usage_per_user
      t.datetime :expire_date
      t.datetime :start_date
      t.string :success_message
      t.string :coupon_message
      t.integer :status

      t.timestamps null: false
    end
  end
end
