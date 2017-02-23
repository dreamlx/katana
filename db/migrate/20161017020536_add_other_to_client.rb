class AddOtherToClient < ActiveRecord::Migration
  def change
    add_column :clients, :other, :text
  end
end
