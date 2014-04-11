class AddLettersToGame < ActiveRecord::Migration
  def change
    add_column :games, :letters, :string, default: ""
  end
end
