class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :chances, default: 0
      t.string :word

      t.timestamps
    end
  end
end
