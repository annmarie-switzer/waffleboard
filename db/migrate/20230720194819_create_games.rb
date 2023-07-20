class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :home_team_id, null: false, foreign_key: { to_table: :teams }
      t.references :away_team_id, null: false, foreign_key: { to_table: :teams }
      t.string :uuid, null: false
      t.string :status
      t.datetime :scheduled
      t.integer :home_points
      t.integer :away_points
      t.integer :venue_id
      t.timestamps
    end
  end
end
