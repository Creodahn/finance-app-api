class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :file_name
      t.string :url
      t.text :description
      t.references :imageable, polymorphic: true, index: true
      t.references :uploader, references: :profiles, index: true

      t.timestamps null: false
    end
  end
end
