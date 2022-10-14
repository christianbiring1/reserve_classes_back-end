class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :reservations
  validates :image, :title, presence: true
  has_one_attached :image
end
