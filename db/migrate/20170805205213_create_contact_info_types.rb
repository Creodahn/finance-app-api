class CreateContactInfoTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_info_types do |t|
      t.string :name
      t.string :description
      t.boolean :phone_only

      t.timestamps null: false
    end
  end
end
