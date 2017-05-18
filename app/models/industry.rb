class Industry < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :categories
  has_many :services, through: :categories
  has_many :pros, foreign_key: :user
end
