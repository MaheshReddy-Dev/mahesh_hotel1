class Client < ApplicationRecord
  has_secure_password
  validates :emaail, presence: true, uniqueness: true
  has_many :hotels
  has_many :regions, through: :hotels
end