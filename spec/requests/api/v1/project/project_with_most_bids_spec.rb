require 'rails_helper'

describe 'user can call api' do

  xit "and see the project with the most bids" do
    10.times do |n|
      User.new(first_name: "Burt", last_name: "Reynolds", zipcode: "80203", phone_number: "5555554", email: "a#{n}@a.com", password: "a").save(validate: false)
      @user = User.last
      Pro.new(first_name: "Bob", last_name: "Ross", zipcode: "80203", phone_number: "5555555", email: "b#{n}@b.com", password: "b").save(validate: false)
      @pro = Pro.last
      @pro.create_pro_service(service_ids: [rand(1..3)], radius: 10)
      3.times do |m|
        Project.new(status: :completed, zipcode: "80203", recurring: false, description: "MOW MY LAWN", timeline: 'ASAP', requester_id: @user.id, service_id: rand(1..3)).save(validate: false)
      end
      Bid.new(user_id: @pro.id, project_id: @pro, amount: rand(30..300).to_s, comment: "I WILL MOW YOUR LAWN").save(validate: false)
    end
    # user can see the project that has the highest number of bids
    # i.e. what individual project has been bid on the most and how many bids


    get "/api/v1/projects/most_bid_project"

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
