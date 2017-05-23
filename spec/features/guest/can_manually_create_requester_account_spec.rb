require 'rails_helper'

RSpec.describe "Guest Bcrypt Authentication Process" do
  xit "guest can create an account" do
    visit '/'

    click_on "Sign Up"
    expect(current_path).to eq('/choose-account')
    click_on "Sign Up To Hire"

    fill_in "user[first_name]", with: "Arnold"
    fill_in "user[last_name]", with: "Schwarzenegger"
    fill_in "user[phone_number]", with: "8675309"
    fill_in "user[zipcode]", with: "79720"
    fill_in "user[email]", with: "arny22@gmail.com"
    fill_in "user[password]", with: "hunter2"
    fill_in "user[password_confirmation]", with: "hunter2"



    stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/ACa54e67dbaaf8ba2007f066cebf1e483b/Messages.json").
         with(body: {"Body"=>"3094348", "From"=>"5126451696", "To"=>"3944568"},
              headers: {'Accept'=>'application/json', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Basic QUNhNTRlNjdkYmFhZjhiYTIwMDdmMDY2Y2ViZjFlNDgzYjowNmJiZjNjNGNkZDdjMGFlYjZhZGU0MjYwNmE3NzVhMg==', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'twilio-ruby/4.13.0 (ruby/x86_64-darwin15 2.3.0-p0)'}).
         to_return(status: 200, body: "", headers: {})

    click_on "Create Account"

    expect(current_path).to eq('/profile/dashboard')

    latest_user = User.last

    expect(latest_user.first_name).to eq("Arnold")
    expect(latest_user.email).to eq("arny22@gmail.com")
  end
end
