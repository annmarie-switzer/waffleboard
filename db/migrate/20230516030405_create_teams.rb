class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :nhl_id
      t.string :name
      t.string :market

      t.timestamps
    end
  end
end
