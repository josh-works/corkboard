require 'rails_helper'

RSpec.describe "a logged user can see available projects they've made" do
  let!(:project_2_email) { project_2.requester.email }
  let!(:project_1_email) { project_1.requester.email }
  let!(:user) { create(:user) }
  let!(:project_1) { create(:project, service: service_1, requester_id: user.id) }
  let!(:project_2) { create(:project, service: service_2, requester_id: user.id) }
  let!(:service_1) { create(:service, category: category) }
  let!(:service_2) { create(:service, name: 'Gardening', category: category) }
  let!(:category)  { create(:category, name: 'Lawn & Garden', industry: industry) }
  let!(:industry)  { create(:industry, name: 'Home Improvement')}

  it "User visits their dashboard" do
    page.set_rack_session(user_id: user.id, authenticated: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(page).to have_content("Welcome #{user.first_name}")
    expect(page).to have_css('.projects')
    expect(page).to have_css('.project')

    within(first('.project')) do
      expect(page).to have_content("Service Name: #{user.requested_projects.first.service.name}")
      expect(page).to have_content("Current Status of this Project: #{user.requested_projects.first.status}")
      expect(page).to have_content("Recurrence: #{user.requested_projects.first.recurring}")
      expect(page).to have_content("Timeline: #{user.requested_projects.first.timeline}")
      expect(page).to have_link("View Project")
    end

    # within(last('.project')) do
      # expect(page).to have_content("Service Name: #{user.requested_projects.last.service.name}")
      # expect(page).to have_content("Current Status of this Project: #{user.requested_projects.last.status}")
      # expect(page).to have_content("Recurrence: #{user.requested_projects.last.recurring}")
      # expect(page).to have_content("Timeline: #{user.requested_projects.last.timeline}")
      # expect(page).to have_link("View Project")
    # end
  end
end
