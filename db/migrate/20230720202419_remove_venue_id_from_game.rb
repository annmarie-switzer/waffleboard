class RemoveVenueIdFromGame < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :venue_id
  end
end
