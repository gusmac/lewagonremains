class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :storage_space, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.monetize :price

      t.timestamps
    end
  end
end
