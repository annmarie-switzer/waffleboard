class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :nhl_id
      t.string :status
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :abbr_name
      t.integer :height
      t.integer :weight
      t.string :handedness
      t.string :position
      t.string :primary_position
      t.integer :jersey_number
      t.string :college
      t.integer :experience
      t.string :birth_place
      t.date :birthdate
      t.integer :rookie_year
      t.string :draft_team_id
      t.integer :draft_year
      t.integer :draft_round
      t.integer :draft_pick
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
