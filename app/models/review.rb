class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pro

    def self.total_count(pro)
      where(pro_id: pro).count
    end

  def self.total_average(pro)
    where(pro_id: pro).average(:rating).to_i
  end
  #
  # def self.highest_rated(category)
  #   # find the category
  #   # find all the pros associated with that category
  #   # find total_average of each pro
  #   # organize pros by highest to lowest
  #
  # end

  # def self.lowest_rated(category)
  #   # find the category
  #   # find all the pros associated with that category
  #   # find total_average of each pro
  #   # organize pros by lowest to highest
  # end
end
