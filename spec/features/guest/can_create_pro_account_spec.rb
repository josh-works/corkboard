require 'rails_helper'

RSpec.describe "Guest can create Pro Process" do
  before(:each) do
    @industry = Industry.create!(name: "Home Improvement")
    @category = @industry.categories.create!(name: "Lawn & Garden")
    @service1 = @category.services.create!(name: "Lawn Mowing & Trimming")
    @service2 = @category.services.create!(name: "Gardening")
    @service3 = @category.services.create!(name: "Leaf Clean up")
    # let!(:industry) {build(:industry)}
    # let!(:category) {build(:category)}
    # let!(:service) {build(:service)}

  end

  it "guest can manually create an account (with bcrypt)" do
    page.set_rack_session(service_ids: [@service1.id, @service2.id])

    visit '/'

    click_on "Sign Up"
    expect(current_path).to eq(choose_account_path)
    click_on "Join As a Pro"

    expect(current_path).to eq(pro_register_industry_index_path)
    expect(page).to have_css(".industry-choices")

    within ".industry-choices" do
      expect(page).to have_content("Home Improvement")
    end

    click_on "Home Improvement"

    expect(current_path).to eq(pro_register_industry_category_index_path(@industry.slug))
    within ".category-choices" do
      expect(page).to have_content("Lawn & Garden")
    end

    click_on 'Lawn & Garden'

    expect(current_path).to eq(pro_register_industry_category_path(@industry, @category.slug))

    within ".service-choices" do
      expect(page).to have_content("Lawn Mowing & Trimming")
      expect(page).to have_content("Gardening")
      expect(page).to have_content("Leaf Clean up")
    end

    find(:css, "#service_id_[value='1']").set(true)
    find(:css, "#service_id_[value='2']").set(true)
    find(:css, "#service_id_[value='3']").set(false)

    click_on 'Submit'
    expect(current_path).to eq(pro_register_signup_path)

    expect(page).to have_content("Lawn Mowing & Trimming")
    expect(page).to have_content("Gardening")
    expect(page).to_not have_content("Leaf Clean up")

    fill_in "pro[first_name]", with: "Arnold"
    fill_in "pro[last_name]", with: "Schwarzenegger"
    fill_in "pro[phone_number]", with: "8085559111"
    fill_in "pro[zipcode]", with: "79720"
    fill_in "pro[email]", with: "arny22@gmail.com"
    fill_in "pro[password]", with: "hunter2"
    fill_in "pro[password_confirmation]", with: "hunter2"

    click_on "Create Account"

    expect(current_path).to eq(pro_dashboard_path)

    latest_user = Pro.last
    expect(latest_user.class).to eq Pro

    expect(latest_user.first_name).to eq("Arnold")
    expect(latest_user.email).to eq("arny22@gmail.com")

    expect(latest_user.services.count).to eq(2)
    expect(latest_user.services.first.name).to eq(@service1.name)

  end
end
