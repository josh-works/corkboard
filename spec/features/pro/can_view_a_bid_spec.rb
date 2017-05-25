require 'rails_helper'

RSpec.describe 'a logged-in pro' do
  let(:pro) { create(:pro_user) }
  let(:requester) { create(:user) }
  let(:project) { create(:project, requester: requester) }
  let(:bid) { create(:bid, project: project, pro: pro)}

  # let!(:project) { create(:project, service: service) }
  # let!(:service) { create(:service, category: category) }
  # let!(:category)  { create(:category, name: 'Lawn & Garden', industry: industry) }
  # let!(:industry)  { create(:industry, name: 'Home Improvement')}

  it "can view a bid" do
    page.set_rack_session(user_id: pro.id, authenticated: true)

    visit "/bids/#{bid.id}"

    expect(current_path).to eq("/bids/#{bid.id}")

    fill_in("message[content]", with: "Yo")

    within(:css, ".panel") do
      expect(page).to have_content("Yo")
    end
  end
end
