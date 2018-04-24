class AddAmountPrivateKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :amount, :integer
    add_column :users, :private_key, :string
  end
end
