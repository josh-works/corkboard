class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pro

  # validates :body, :rating

  def self.total_count(pro)
    where(pro_id: pro).count
  end

  def self.total_average(pro)
    # find the pro
    # get all the ratings
    # add all the ratings
    # divide by number of ratings
  end

  def self.highest_rated(category)
    # find the category
    # find all the pros
    # find total_average of each pro
    # organize pros by highest to lowest

  end

  def self.lowest_rated(category)
    # find the category
    # find all the pros
    # find total_average of each pro
    # organize pros by lowest to highest  
  end

end
