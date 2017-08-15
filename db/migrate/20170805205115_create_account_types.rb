class CreateAccountTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :account_types do |t|
      t.string :name
      t.string :description
      t.boolean :is_debt, null: false, default: false

      t.timestamps null: false
    end
  end
end
