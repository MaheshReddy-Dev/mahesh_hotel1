class RoomFacility < ApplicationRecord
    belongs_to :room_facility_category
    belongs_to :room
    def room_type
      room.room_type
    end
  end
  