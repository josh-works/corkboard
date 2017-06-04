require 'rails_helper'

RSpec.describe "a logged-in user can see a project they've made and the bids submitted" do
  #make project, user pro and bid here
  it "User visits their dashboard and clicks on individual project" do
    Service.new(name: "Charter Bus Rental", slug: "charter-bus-rental").save(validate: false)
    @service = Service.last

    User.new(first_name: "Burt", last_name: "Reynolds", zipcode: "80203", phone_number: "5555554", email: "a1@a.com", password: "a").save(validate: false)
    @user = User.last

    Pro.new(first_name: "Bob", last_name: "Ross", zipcode: "80203", phone_number: "5555555", email: "b1@b.com", password: "b").save(validate: false)
    @pro = Pro.last
    @pro.create_pro_service(service_ids: [40], radius: rand(1..10))

    Project.new(status: :open, zipcode: "80203", recurring: false, description: "i am years old", timeline: 'ASAP', requester_id: @user.id, service_id: @service.id).save(validate: false)
    @project = Project.last

    Bid.new(user_id: @pro.id, project_id: @project.id, amount: rand(30..300).to_s, comment: "I THINK THIS NEEDS TO BE A MESSAGE_ID").save(validate: false)
    @bid = Bid.last

    visit "/hire/#{@project.service.slug}/#{@project.id}"

    expect(page).to have_css('.bids')
    expect(page).to have_css('.bid')

    within(first('.bid')) do
      expect(page).to have_content("Amount: #{@bid.amount}")
      expect(page).to have_content("Discussion: #{@bid.comment}")
      expect(page).to have_link("Accept Bid")
    end

    expect(@project.status).to eq("open")
    click_on("Accept Bid")
    expect(Project.last.status).to eq("accepted")
  end
end
