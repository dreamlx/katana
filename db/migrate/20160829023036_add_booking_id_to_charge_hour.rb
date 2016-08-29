class AddBookingIdToChargeHour < ActiveRecord::Migration
  def change
    add_column :charge_hours, :booking_id, :integer
  end
end
