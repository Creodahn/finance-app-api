class CreateRolesRights < ActiveRecord::Migration[5.1]
  def change
    create_table :roles_rights do |t|
      t.belongs_to :role, index: true
      t.belongs_to :right, index: true

      t.timestamps null: false
    end
  end
end
