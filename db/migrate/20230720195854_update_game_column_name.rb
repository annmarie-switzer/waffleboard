class UpdateGameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :games, :home_team_id_id, :home_team_id
    rename_column :games, :away_team_id_id, :away_team_id
  end
end
