class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :title
      t.string :address
      t.string :contact

      t.timestamps null: false
    end
  end
end
