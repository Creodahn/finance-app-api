class RemoveAccountNumberRoutingNumberFromAccounts < ActiveRecord::Migration[5.1]
  def change
    remove_column :accounts, :account_number
    remove_column :accounts, :routing_number
  end
end
