require 'rails_helper'

RSpec.describe 'user creates a project' do
  let!(:industry) { create(:industry, name: 'Home Improvement') }
  let!(:category) { create(:category, name: 'Lawn Care', industry: industry) }
  let!(:service)  { create(:service, name: 'Mowing', category: category) }
  let!(:user)     { create(:user) }

  scenario 'with valid inputs' do
    page.set_rack_session(user_id: user.id)

    visit root_path

    click_link('home-link')
    expect(current_path).to eq('/home-improvement')

    click_link("#{category.slug}")
    expect(current_path).to eq('/home-improvement/lawn-care')

    click_on("#{service.slug}")
    expect(current_path).to eq('/hire/mowing')

    expect(page).to have_css('.project-form')

    fill_in('project[zipcode]', :with => '80210')
    choose('Recurring')
    fill_in('project[description]', :with => 'This is a project that I need done right away')
    choose('ASAP')

    expect(page).to_not have_content('Login or Sign Up to request this project')
    click_on 'Submit'

    new_project = Project.last

    expect(Project.count).to eq(1)
    expect(current_path).to eq(new_project_confirmation_path(new_project))
  end
end

