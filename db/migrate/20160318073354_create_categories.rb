class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.integer :parent_id
      t.string :url_string
      t.string :seo_title
      t.string :seo_meta

      t.timestamps null: false
    end
  end
end
