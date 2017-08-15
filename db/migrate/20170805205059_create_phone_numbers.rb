class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.string :country_code
      t.string :area_code
      t.string :prefix
      t.string :subscriber_number
      t.string :extension
      t.boolean :is_primary

      t.belongs_to :contact_info_type, index: true
      t.belongs_to :profile, index: true

      t.timestamps null: false
    end
  end
end
