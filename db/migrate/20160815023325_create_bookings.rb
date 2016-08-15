class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :member_id
      t.integer :project_id
      t.text :description
      t.string :state

      t.timestamps null: false
    end
  end
end
