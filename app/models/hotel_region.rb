# frozen_string_literal: true

class HotelRegion < ApplicationRecord
  belongs_to :hotel
  belongs_to :region
end
