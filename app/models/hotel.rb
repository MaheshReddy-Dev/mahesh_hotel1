class Hotel < ApplicationRecord
  belongs_to :client
  has_many :hotel_regions
  has_many :regions, through: :hotel_regions
  has_many :hotel_locations
  has_many :locations, through: :hotel_locations
  has_many :rooms, dependent: :destroy

  validates :name, presence: true
  validates :regions, presence: true
  validates :locations, presence: true
  validates :client_id, presence: true
end
