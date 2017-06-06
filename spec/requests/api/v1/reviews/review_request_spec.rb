require 'rails_helper'

RSpec.describe "Reviews API" do
  it "shows all reviews" do
    create_list(:review, 3)

    database_review = Review.first

    get "/api/v1/reviews"

    reviews = JSON.parse(response.body)
    review = reviews.first

    expect(response).to be_success
    expect(review["id"]).to eq(database_review.id)
    expect(review["body"]).to eq(database_review.body)
   end

   xit "shows one review" do
     database_review = create(:review)
     get "api/v1/reviews/#{database_review.id}"

     expect(response).to be_success

     review = JSON.parse(response.body)
     expect(review["id"]).to eq(database_review.id)
     expect(review["body"]).to eq(database_review.id)
   end
end
