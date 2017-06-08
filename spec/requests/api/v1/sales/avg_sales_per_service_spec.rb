require 'rails_helper'

describe 'user can call api' do

  it "and see the average revenue for each service" do
    10.times do |n|
      User.new(first_name: "Burt", last_name: "Reynolds", zipcode: "80203", phone_number: "5555554", email: "a#{n}@a.com", password: "a").save(validate: false)
      @user = User.last
      Pro.new(first_name: "Bob", last_name: "Ross", zipcode: "80203", phone_number: "5555555", email: "b#{n}@b.com", password: "b").save(validate: false)
      @pro = Pro.last
      @pro.create_pro_service(service_ids: [rand(1..3)], radius: 10)

      2.times do |m|
        Project.new(status: :completed, zipcode: "80203", recurring: false, description: "MOW MY LAWN", timeline: 'ASAP', requester_id: @user.id, service_id: rand(1..3)).save(validate: false)
        @project = Project.last
        Bid.new(user_id: @pro.id, project_id: @project.id, amount: rand(30..300).to_s, comment: "I WILL MOW YOUR LAWN").save(validate: false)
        @bid = Bid.last
      end
    end

    get "/api/v1/bids/revenue_per_service"

    expect(response).to be_success
    bidz = JSON.parse(response.body, symbolize_names: true)
    bid_json = bidz.first
    #
    # expect(customers.count).to eq(5)
    # expect(customer[:first_name]).to be_a String
    # expect(customer[:last_name]).to be_a String
    # expect(customer).to have_key(:first_name)
    # expect(customer).to have_key(:last_name)

  end
end









#
