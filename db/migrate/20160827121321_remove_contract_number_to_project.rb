class RemoveContractNumberToProject < ActiveRecord::Migration
  def change
    remove_column :projects, :contract_number, :string
  end
end
