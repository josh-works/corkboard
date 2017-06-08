class Service < ApplicationRecord
  include Sluggable

  before_validation :generate_slug

  validates :name, presence: true
  validates :category, presence: true
  validates :slug, presence: true,
                   uniqueness: true

  belongs_to :category
  delegate :industry, :to => :category, :allow_nil => false

  has_many :projects


  def self.pro_service_ids(params)
    Service.where(id: params).map do |service|
      service.id
    end
  end

  def self.render_autocomplete(term)
    names = Service.where(['lower(name) LIKE ?', "%#{term.downcase}%"])
    .pluck(:name)
    services = names.map do |name|
      {value: "/hire/#{name.parameterize}/new",
              label: name}
    end
    services
  end
end
