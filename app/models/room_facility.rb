# frozen_string_literal: true

class RoomFacility < ApplicationRecord
  belongs_to :room_facility_category
  belongs_to :room

  validates :name, presence: true
end
