class Bid < ApplicationRecord
  validates :comment, presence: true
  validates :amount, presence: true

  belongs_to :pro, foreign_key: :user_id
  belongs_to :project

  enum status: [:open, :accepted, :rejected]

  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments
end
