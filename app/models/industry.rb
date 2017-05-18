class Industry < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :categories
  has_many :services, through: :categories
end
