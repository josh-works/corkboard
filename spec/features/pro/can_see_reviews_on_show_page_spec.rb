require 'rails_helper'

RSpec.describe "a logged in pro can see their own reviews" do
  scenario "visits their dashboard show page" do
    VCR.use_cassette("find_reviews") do
      first_review = review_stub[0]

      visit '/pro/dashboard'

      expect(current_path).to eq('/pro_dashboard')

      within '.rating' do
        expect(page).to have_content(first_review[:rating])
        expect(page).to have_content(first_review[:body])
      end
    end
  end
end
