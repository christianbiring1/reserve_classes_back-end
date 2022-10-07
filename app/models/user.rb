class User < ApplicationRecord
  has_secure_password
  has_many :groups
  has_many :reservations

  validates_presence_of :email
  validates_uniqueness_of :email
end
