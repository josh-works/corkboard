class Category < ApplicationRecord
  before_validation :generate_slug

  validates :industry, presence: true
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: true

  belongs_to :industry
  has_many :services

  def to_param
    slug
  end

  def generate_slug
    self.slug = name.parameterize
  end

  def self.find(input)
    # monkey patches .find to be able to find by id and slug
    if input.to_i != 0
      super
    else
      find_by_slug(input)
    end
  end
end
