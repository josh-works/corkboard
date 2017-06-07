class ProReview
  attr_reader :body, :rating, :pro_id

  def initialize(raw_rating={})
    @body = raw_rating[:body]
    @rating = raw_rating[:rating]
    @pro_id = raw_rating[:pro_id]
  end

end
