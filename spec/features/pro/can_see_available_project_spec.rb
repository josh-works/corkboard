require 'rails_helper'

RSpec.describe 'a logged pro can see available projects that match its services' do
  let!(:industry)  { create(:industry, name: 'Home Improvement')}
  let!(:category)  { create(:category, name: 'Lawn & Garden', industry: industry) }
  let!(:service_1) { create(:service, category: category) }
  let!(:service_2) { create(:service, name: 'Gardening', category: category) }
  let!(:project_1) { create(:project, service: service_1) }
  let!(:project_2) { create(:project, service: service_2) }
  let!(:pro_service) { create(:pro_service, service_ids: [service_1.id]) }
  let!(:pro) { create(:pro_user, pro_service: pro_service) }
  let(:project_1_email) { project_1.requester.email }
  let(:project_2_email) { project_2.requester.email }

  xit 'visits find new projects page and and sees a list of projects that match services' do
    page.set_rack_session(user_id: pro.id, authenticated: true)

    visit '/pro/dashboard'

    click_link 'Find Projects'

    expect(current_path).to eq('pro/open-projects/')

    expect(page).to have_content(project_1_email)
    expect(page).to have_content(project_1.service)
    expect(page).to have_content(project_2_email)
    expect(page).to have_content(project_2.service)
  end
end
