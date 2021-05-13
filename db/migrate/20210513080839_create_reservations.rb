class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :restaurant_name
      t.datetime :booked_time
      t.string :booked_email
      t.string :notes
      t.boolean :reserved, default: false
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
