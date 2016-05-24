class AddRankToHomes < ActiveRecord::Migration
  def change
  	add_column :homes, :rank, :integer
  end
end
