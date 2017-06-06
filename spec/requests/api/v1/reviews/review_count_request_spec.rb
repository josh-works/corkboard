require 'rails_helper'

RSpec.describe "Reviews API" do
  it "shows total count of reviews per pro" do
    pro = create(:pro_user)
    reviews = create_list(:review, 25, pro: pro)

    get "/api/v1/reviews/#{pro.id}/review_count"

    reviews = JSON.parse(response.body)

    require "pry"; binding.pry
    expect(response).to be_success

    expect(reviews.count).to be(25)
  end
end
