class Category < ApplicationRecord
  validates :industry, presence: true
  validates :name, presence: true

  belongs_to :industry
  has_many :services
end
