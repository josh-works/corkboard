class ReviewService

  def initialize(params)
    @pro_id = params[:pro_id]
    @_conn = Faraday.new("http://localhost:3000")
  end

  def find_average
    response = conn.get("/api/v1/reviews/#{pro_id}/review_count")
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_count
    response = conn.get("/api/v1/reviews/#{pro_id}/review_average")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    attr_reader :pro_id

    def conn
      @_conn
    end
end
