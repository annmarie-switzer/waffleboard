class AddLogoColumnToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :logo, :string
  end
end
