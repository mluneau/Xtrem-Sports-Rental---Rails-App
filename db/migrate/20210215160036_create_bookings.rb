class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_price
      t.integer :rating
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
