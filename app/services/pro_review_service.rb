class ProReviewService

  attr_reader :pro_id, :conn

  def initialize
    @pro_id = pro_id
    @conn = Faraday.new("http://localhost:3000")
  end

  def find_count
    response = conn.get("/api/v1/reviews/#{pro_id}/review_count")
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_average(pro)
    response = conn.get("/api/v1/reviews/#{pro}/review_average")
    JSON.parse(response.body, symbolize_names: true)

  end

  private

    attr_reader :conn

    def conn
      @conn
    end
end
