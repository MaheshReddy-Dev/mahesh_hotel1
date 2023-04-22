# frozen_string_literal: true

class HotelLocation < ApplicationRecord
  belongs_to :hotel
  belongs_to :location
end
