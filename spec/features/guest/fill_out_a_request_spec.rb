require 'rails_helper'

RSpec.feature 'guest fills out a project request' do
  scenario 'from the root path' do
    visit root_path

    click_link('home-link')
    expect(current_path).to eq('/home-improvement')

    click_link('lawn-care-link')
    expect(current_path).to eq('home-improvement/lawn-care')

    click_on('mowing-link')
    expect(current_path).to eq('hire/mowing')

    expect(page).to have_css('.project-form')

    fill_in('zipcode', :with => '80210')
    select('Yes', :from => 'recurring')
    fill_in('description', :with => 'This is a project that I need done right away')
    select('ASAP', :from => 'timeline')
    expect(page).to have_content('Login or Sign Up to request this project')

  end
end