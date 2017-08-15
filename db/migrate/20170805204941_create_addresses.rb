class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :apartment_number
      t.string :city
      t.string :state
      t.string :zip_code
      t.boolean :is_primary

      t.belongs_to :contact_info_type, index: true
      t.belongs_to :profile, index: true

      t.timestamps null: false
    end
  end
end
