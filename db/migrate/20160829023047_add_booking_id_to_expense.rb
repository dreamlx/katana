class AddBookingIdToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :booking_id, :integer
  end
end
