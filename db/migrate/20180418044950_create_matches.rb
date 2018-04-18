class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.references :team_1, foreign_key: {to_table: :teams}
      t.references :team_2, foreign_key: {to_table: :teams}
      t.integer :team_1_score
      t.integer :team_2_score
      t.datetime :time
      t.boolean :result
      t.string :contact_address
      t.string :description

      t.timestamps
    end
  end
end
