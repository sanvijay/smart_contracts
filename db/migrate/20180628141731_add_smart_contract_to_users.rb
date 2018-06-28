class AddSmartContractToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :smart_contract, :string
  end
end
