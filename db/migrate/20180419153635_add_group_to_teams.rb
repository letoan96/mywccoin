class AddGroupToTeams < ActiveRecord::Migration[5.1]
  def change
    add_reference :teams, :group, foreign_key: true
  end
end
