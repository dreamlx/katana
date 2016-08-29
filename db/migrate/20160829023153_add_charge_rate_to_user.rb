class AddChargeRateToUser < ActiveRecord::Migration
  def change
    add_column :users, :charge_rate, :integer
  end
end
