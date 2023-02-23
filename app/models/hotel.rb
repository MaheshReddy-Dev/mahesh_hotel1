class Hotel < ApplicationRecord
  belongs_to :client
  has_many :hotel_regions
  has_many :regions, through: :hotel_regions
end