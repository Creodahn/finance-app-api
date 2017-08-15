class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email, index: true, unique: true

      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
