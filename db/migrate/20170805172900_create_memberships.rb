class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :group, index: true
      t.belongs_to :profile, index: true

      t.timestamps null: false
    end

  end
end
