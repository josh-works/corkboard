
require 'rails_helper'

RSpec.describe "Guest Facebook OAuth Process" do

  before(:each) do
    stub_omniauth
  end

  it "guest can create an account" do

    visit facebook_login_path

    expect(page).to have_field("user[first_name]", with: 'Riley')
    expect(page).to have_field("user[last_name]", with: 'Thompson')
    expect(page).to have_field('user[email]', with: 'rileyt_111@hotmail.com')

    fill_in "user[zipcode]", with: "79720"
    fill_in "user[phone_number]", with: "3944568"


    click_on "Create Account"

    expect(current_path).to eq(twilio_confirmation_path)

    last_message = FakeSMS.messages.last

    fill_in "code_verification[code]", with: last_message.body

    click_on "Verify"

    expect(current_path).to eq(profile_dashboard_path)

    expect(current_path).to eq('/profile/dashboard')

    latest_user = User.last

    expect(latest_user.first_name).to eq("Riley")
    expect(latest_user.email).to eq("rileyt_111@hotmail.com")
  end
end
