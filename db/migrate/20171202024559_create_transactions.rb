class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, null: false
      t.date :transaction_date, null: false

      t.belongs_to :account, index: true
      t.belongs_to :profile, index: true
      t.belongs_to :transaction_type, index: true

      t.timestamps null: false
    end
  end
end
