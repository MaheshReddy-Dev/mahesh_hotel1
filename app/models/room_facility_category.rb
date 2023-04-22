# frozen_string_literal: true

class RoomFacilityCategory < ApplicationRecord
  has_many :room_facilities, dependent: :destroy
end
