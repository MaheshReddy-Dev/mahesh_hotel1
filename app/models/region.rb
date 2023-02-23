class Region < ApplicationRecord
  has_many :locations , dependent: :destroy
  belongs_to :client
  validates :name, presence: true
end