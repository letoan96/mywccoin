class ChangeIndexInTeams < ActiveRecord::Migration[5.1]
  def change
  	remove_index :teams, name: 'index_teams_on_group_id'
    add_index :teams, :id

  end
end
