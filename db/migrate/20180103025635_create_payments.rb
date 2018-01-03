class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.decimal :amount, default: 0
      t.boolean :completed, default: false, null: false
      t.date :completed_on, null: true

      t.belongs_to :transaction, index: true
      t.belongs_to :profile, index: true

      t.timestamps null: false
    end
  end
end
