class CreateRights < ActiveRecord::Migration[5.1]
  def change
    create_table :rights do |t|
      t.string :name, null: false
      t.string :scope, null: false

      t.timestamps null: false
    end
  end
end
