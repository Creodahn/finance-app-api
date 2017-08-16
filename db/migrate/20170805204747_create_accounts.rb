class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.decimal :balance
      t.string :description
      t.string :name
      t.string :routing_number

      t.belongs_to :account_type, index: true
      t.belongs_to :profile, index: true

      t.timestamps null: false
    end
  end
end