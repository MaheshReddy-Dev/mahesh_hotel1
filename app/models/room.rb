class Room < ActiveRecord::Base
  ROOM_TYPES = [:standard, :delux, :suite, :connecting_rooms, :adjoining_rooms, :junior_suite, :presidential_suite, :studio_room, :duplex_room].freeze
  belongs_to :hotel, class_name: "Hotel"
  has_many :room_facilities, dependent: :destroy
  has_many :room_facility_categories, through: :room_facilities
  validates :room_type, presence: true
  validates :number, presence: true
  validates :price, presence: true
end
