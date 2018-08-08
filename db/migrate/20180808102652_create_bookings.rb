class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.user :reference
      t.storage_spaces :reference
      t.date :start_date
      t.date :end_date
      t.monetize :price_cents

      t.timestamps
    end
  end
end
