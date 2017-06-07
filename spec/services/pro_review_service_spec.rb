require 'rails_helper'


describe ProReviewService do
  it "returns raw review details" do
    pro = create(:pro_user)
    review = ProReview.new(body: "hey good job", rating: 5, pro: pro)

    service = ProReviewService.new({rating: review.rating, body: review.body})
    average = service.find_average
    count = service.find_count

    expect(average).to be_a(Hash)
    expect(count).to be_a(Hash)
    expect(average).to have_key(:rating)
    expect(count).to have_key(:rating)
    expect(count[:rating]).to be_a(String)
    expect(average[:rating]).to be_a(String)

  end
end
