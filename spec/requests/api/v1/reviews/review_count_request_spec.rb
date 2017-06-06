require 'rails_helper'

RSpec.describe "Reviews API" do
  it "shows total count of reviews per pro" do
    list = create_list(:review, 25)

    require "pry"; binding.pry

    get "/api/v1/reviews/review_count"

    reviews = JSON.parse(response.body)

    expect(response).to be_success

    expect(reviews.count).to be(25)
  end
end
