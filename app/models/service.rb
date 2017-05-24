class Service < ApplicationRecord
  include Sluggable

  before_validation :generate_slug

  validates :name, presence: true
  validates :category, presence: true
  validates :slug, presence: true,
                   uniqueness: true

  belongs_to :category

  has_many :projects

  def self.pro_service_ids(params)
    Service.where(id: params).map do |service|
      service.id
    end
  end

end
