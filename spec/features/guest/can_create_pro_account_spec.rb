require 'rails_helper'

RSpec.describe "Guest can create Pro Process" do
  before(:each) do
    industry = Industry.create!(name: "Home Improvement")
    category = industry.categories.create!(name: "Lawn & Garden")
    category.services.create!(name: "Lawn Mowing & Trimming")
    # let!(:industry) {build(:industry)}
    # let!(:category) {build(:category)}
    # let!(:service) {build(:service)}

  end

  it "guest can manually create an account (with bcrypt)" do
    visit '/'

    click_on "Sign Up"
    expect(current_path).to eq('/choose-account')
    click_on "Join As a Pro"

    expect(current_path).to eq('/pro_register')
    expect(page).to have_css(".industry-choices")

    within ".industry-choices" do
      expect(page).to have_content("Home Improvement")
    end

    click_on "Home Improvement"

    expect(current_path).to eq('/pro_register/home-improvement')
    within ".category-choices" do
      expect(page).to have_content("Lawn & Garden")
    end

    click_on 'Lawn & Garden'

    expect(current_path).to eq('/pro_register/home-improvement/lawn-garden')

    within ".service-choices" do
      expect(page).to have_content("Lawn Mowing & Trimming")
    end

    click_on "Lawn Mowing & Trimming"

    expect(current_path).to eq '/pro_register/signup'

    fill_in "pro[first_name]", with: "Arnold"
    fill_in "pro[last_name]", with: "Schwarzenegger"
    fill_in "pro[phone_number]", with: "8675309"
    fill_in "pro[zipcode]", with: "79720"
    fill_in "pro[email]", with: "arny22@gmail.com"
    fill_in "pro[password]", with: "hunter2"
    fill_in "pro[password_confirmation]", with: "hunter2"

    click_on "Create Account"

    expect(current_path).to eq('/pro/dashboard')

    latest_user = User.last

    expect(latest_user.first_name).to eq("Arnold")
    expect(latest_user.email).to eq("arny22@gmail.com")

  end
end
