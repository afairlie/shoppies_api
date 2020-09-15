class User < ApplicationRecord
  has_secure_password
  has_one :nomination

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
