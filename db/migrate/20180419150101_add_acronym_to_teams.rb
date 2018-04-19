class AddAcronymToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :acronym, :string
  end
end
