class Client < ApplicationRecord
  has_secure_password
  validates :emaail, presence: true, uniqueness: true
  has_many :hotels, dependent: :destroy
  has_many :locations, through: :hotels
end