class AddTotalNightsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :total_nights, :integer
  end
end
