class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|

      t.references :users, null: false, foreign_key: true
      t.references :pitches, null: false, foreign_key: true
      t.references :owners, null: false, foreign_key: true
      t.string :book_day
      t.string :time_booking
      t.string :start_time_book
      t.string :end_time_book
      t.integer :verified
      t.string :ticket
      t.integer :total_price
    end
  end
end
