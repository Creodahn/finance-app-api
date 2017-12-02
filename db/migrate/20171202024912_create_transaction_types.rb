class CreateTransactionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_types do |t|
      t.boolean :is_debit, null: false, default: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
