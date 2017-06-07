class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pro


    def self.total_count(pro)
      where(pro_id: pro).count
    end

  def self.total_average(pro)
    where(pro_id: pro).average(:rating).to_i
  end

  def self.highest_rated(service)
    Review.where(service_id: 261).pluck(:pro_id)
      # find all the pro_ids associated with that service
      #   .where(pro_id: pro).average(:rating).to_i
      # attach average rating to each pro object
      # rank them highest to lowest
      # return highest
  end

  # def self.lowest_rated(category)
  #   # find the category
  #   # find all the pros associated with that category
  #   # find total_average of each pro
  #   # organize pros by lowest to highest
  # end
end
