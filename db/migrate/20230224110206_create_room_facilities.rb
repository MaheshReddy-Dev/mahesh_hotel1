class CreateRoomFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :room_facilities do |t|
      t.references :room, null: false, foreign_key: true
      t.references :room_facility_category, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
