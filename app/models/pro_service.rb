class ProService < ApplicationRecord
  belongs_to :pro, foreign_key: :user, optional: true
  validates :radius, presence: true
end
