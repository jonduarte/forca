class AddPenaltyToGames < ActiveRecord::Migration
  def change
    add_column :games, :penalty, :boolean, default: false
  end
end
