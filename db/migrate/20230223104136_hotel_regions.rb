class HotelRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_regions do |t|
      t.integer :hotel_id
      t.integer :region_id
      t.timestamps
    end 
  end
end 