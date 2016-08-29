class DescriptionToChargeHour < ActiveRecord::Migration
  def change
  	add_column :charge_hours, :description, :text
  end
end
