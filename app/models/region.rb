# frozen_string_literal: true

class Region < ApplicationRecord
  has_many :locations, dependent: :destroy
  validates :name, presence: true
end
