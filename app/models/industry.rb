class Industry < ApplicationRecord
  include Sluggable

  before_validation :generate_slug

  validates :name, presence: true,
                   uniqueness: true

  validates :slug, presence: true,
                   uniqueness: true

  has_many :categories
  has_many :services, through: :categories
  has_many :pros, foreign_key: :user
end
