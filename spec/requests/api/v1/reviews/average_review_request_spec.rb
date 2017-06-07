require 'rails_helper'

RSpec.describe "Reviews API" do
  it "shows the average of professional's ratings" do
    pro = create(:pro_user)
    create_list(:review, 25, pro: pro)

    get "/api/v1/reviews/#{pro.id}/review_average"

    reviews = response.body

    expect(response).to be_success

    expect(reviews).to eq("2")

  end
end
