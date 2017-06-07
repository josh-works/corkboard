class Rating
  attr_reader :body, :rating

  def initialize(raw_rating={})
    @body = raw_rating[:body]
    @rating = raw_rating[:rating]
  end

end
