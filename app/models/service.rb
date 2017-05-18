class Service < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true

  belongs_to :category
end
