class Review < ApplicationRecord
  belongs_to :rum
  belongs_to :user
  validates :rum, presence: true
  validates :content, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }, numericality: true
end
