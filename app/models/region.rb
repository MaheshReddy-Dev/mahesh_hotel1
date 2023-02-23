class Region < ApplicationRecord
  belongs_to :client
  has_many :hotel_regions
  has_many :hotels, through: :hotel_regions
end