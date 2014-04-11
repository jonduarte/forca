class RemoveChancesFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :chances, :integer, default: 0
  end
end
