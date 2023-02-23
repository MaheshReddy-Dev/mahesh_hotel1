class Location < ApplicationRecord
  belongs_to :region
  has_one :hotel, dependent: :destroy
end
