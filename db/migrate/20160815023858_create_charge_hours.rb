class CreateChargeHours < ActiveRecord::Migration
  def change
    create_table :charge_hours do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :period_id
      t.float :hours
      t.decimal :charge_rate
      t.date :charge_date
      t.string :state

      t.timestamps null: false
    end
  end
end
