class Category < ApplicationRecord
  include Sluggable

  before_validation :generate_slug

  validates :industry, presence: true
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: true

  belongs_to :industry
  has_many :services


  def self.render_autocomplete(term)
    categories = Category.where(['lower(name) LIKE ?', "%#{term.downcase}%"])

    names = categories.pluck(:name)
    industry_ids = categories.pluck(:industry_id)
    industry_slugs = industry_ids.map { |id| Category.get_industry_slug(id)}

    categories = names.map.with_index(0) do |name, index|
      {value: "/hire/#{industry_slugs[index]}/#{name.parameterize}",
       label: name}
    end
    categories
  end


  def self.get_industry_slug(industry_id)
    case industry_id
    when 1
      "home-improvement"
    when 2
      "events"
    when 3
      "lessons"
    when 4
      "wellness"
    when 5
      "more"
    end
  end

end
