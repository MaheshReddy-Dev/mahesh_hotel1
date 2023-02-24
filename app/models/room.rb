class Room < ApplicationRecord
  ROOM_TYPES = [:standard, :delux, :suite, :connecting_rooms,:adjoining_rooms,:junior_suite, :presidential_suite,:studio_room,duplex_room].freeze
  belongs_to :hotel, class_name: "MyApp::Models::Hotel"
  has_many :room_facilities, dependent: :destroy
  has_many :room_facility_categories, through: :room_facilities
end
Z