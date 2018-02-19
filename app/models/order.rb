class Order < ApplicationRecord
  belongs_to :rum
  belongs_to :user
  validates :quantity, presence: true
  validates :status, inclusion: {in: ["En attente", "accepté", "annulé", "finalisé"]}
end
