class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :team_1st, foreign_key: {to_table: :teams}
      t.references :team_2nd, foreign_key: {to_table: :teams}
      t.timestamps
    end
  end
end
