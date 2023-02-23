class Hotel < ApplicationRecord
  belongs_to :client
  has_many :hotel_regions
  has_many :regions, through: :hotel_regions
  has_many :hotel_locations
  has_many :locations, through: :hotel_locations
end