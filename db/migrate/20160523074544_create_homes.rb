class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :banner_name
      t.string :path
      t.integer :classified_as

      t.timestamps null: false
    end
  end
end
