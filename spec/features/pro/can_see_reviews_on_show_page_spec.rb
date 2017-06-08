require 'rails_helper'

RSpec.describe "a logged in pro can see their own reviews" do
  scenario "visits their dashboard show page" do
    VCR.use_cassette("find_reviews") do
      pro = create(:pro_user, id: 21)
      first_review = review_stub[0]

      # pro = Pro.create!(id: 21, first_name: "Bob0", last_name: "Ross", zipcode: "80237", phone_number: "5555555", email: "b0@b.com")

      visit "ap/v1/reviews/#{pro.id}/dashboard"

      expect(response.status).to eq(200)

      expect(current_path).to eq('/pro_dashboard')

      within '.rating' do
        expect(page).to have_content(first_review[:rating])
        expect(page).to have_content(first_review[:body])
      end
    end
  end
end
