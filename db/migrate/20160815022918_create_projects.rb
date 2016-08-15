class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :owner_id
      t.string :title
      t.text :description
      t.date :start_date
      t.date :close_date
      t.string :job_code
      t.string :contract_number
      t.string :collection_risk
      t.string :state
      t.decimal :estimated_commision
      t.decimal :estimated_outsourcing
      t.decimal :budgeted_service_fee
      t.decimal :budgeted_expense
      t.integer :billing_responsibility_user_id

      t.timestamps null: false
    end
  end
end
