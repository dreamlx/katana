class AddPeriodIdToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :period_id, :integer
  end
end
