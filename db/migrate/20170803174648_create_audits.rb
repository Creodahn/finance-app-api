class CreateAudits < ActiveRecord::Migration[5.1]
  def change
    create_table :audits do |t|
      t.string :action
      t.string :column_name
      t.string :previous_value
      t.string :current_value

      t.references :auditable, :polymorphic => true

      t.belongs_to :profile

      t.timestamps null: false
    end
  end
end
