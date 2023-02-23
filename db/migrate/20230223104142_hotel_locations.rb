class HotelLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_locations do |t|
      t.integer :hotel_id
      t.integer :location_id
      t.timestamps
    end
  end
end 
