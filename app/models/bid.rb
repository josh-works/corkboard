class Bid < ApplicationRecord
  validates :comment, presence: true
  validates :amount, presence: true

  belongs_to :pro, foreign_key: :user_id
  belongs_to :project

  enum status: [:open, :accepted, :rejected]
end
