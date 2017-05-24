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

  xit "can view a bid" do
    page.set_rack_session(user_id: pro.id, authenticated: true)

    visit "/bids/#{bid.id}"

    expect(current_path).to eq("/bids/#{bid.id}")

    fill_in(".message-input", with: "Yo")

    within(:css, ".conversation") do
      expect(page).to have_content("Yo")
    end

    # visit pro_dashboard_open_projects_path
    #
    # click_on "View"
    #
    # expect(current_path).to eq(pro_dashboard_open_project_path(project))
    #
    # fill_in "bid[amount]", with: "100"
    # fill_in "bid[comment]", with: "I'd like to work on this project."
    #
    # click_on "Place Bid"
    #
    # expect(current_path).to eq(pro_dashboard_project_bids_path)
  end
end
