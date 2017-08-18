class CreateInterestRateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :interest_rate_types do |t|
      t.string :description
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
