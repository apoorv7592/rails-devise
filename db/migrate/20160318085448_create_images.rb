class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.attachment :image
      t.string :alt_tag
      t.text :details
      t.integer :priority, limit:1
      t.integer :sub_type, limit:1

      t.timestamps null: false
    end
  end
end


