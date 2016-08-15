class AddProjectIdToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :project_id, :integer
  end
end
