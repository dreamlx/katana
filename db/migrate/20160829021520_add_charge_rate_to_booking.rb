class AddChargeRateToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :charge_rate, :integer
  end
end
