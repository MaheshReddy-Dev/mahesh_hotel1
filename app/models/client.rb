class Client < ApplicationRecord
  has_secure_password
  validates :emaail, presence: true, uniqueness: true
  validates :name, presence: true
  validates :company, presence: true
  validates :address, presence: true
  has_many :hotels, dependent: :destroy
  has_many :locations, through: :hotels
end