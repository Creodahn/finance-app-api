class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.date :authenticated_at
      t.string :auth_token

      t.timestamps null: false
    end
  end
end
