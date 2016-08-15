class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :contract_number
      t.decimal :contract_amount
      t.decimal :estimated_Annual_fee
      t.string :attachment

      t.timestamps null: false
    end
  end
end
