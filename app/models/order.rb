class Order < ApplicationRecord
  belongs_to :rum
  belongs_to :user
  validates :quantity, presence: true
  validates :status, inclusion: {in: ["en attente", "accepté", "annulé", "refusé", "finalisé"]}
end
