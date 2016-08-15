class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :expense_category_id
      t.decimal :amount
      t.date :charge_date
      t.string :state

      t.timestamps null: false
    end
  end
end
