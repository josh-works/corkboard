require 'rails_helper'

describe 'user can call api' do

  it "and see the project with the most bids" do
    Category.create!(name: "bobert", industry: Industry.create!(name: "bob"))

    @service = []
    3.times do |n|
      Service.create!(name: "service#{n}", category: Category.last, slug: "service-#{n}")
      @service << Service.last
    end

    5.times do |n|
      User.new(first_name: "Burt", last_name: "Reynolds", zipcode: "80203", phone_number: "5555554", email: "a#{n}@a.com", password: "a").save(validate: false)
      @user = User.last

      5.times do |m|
        Project.new(status: :completed, zipcode: "80203", recurring: false, description: "MOW MY LAWN", timeline: 'ASAP', requester_id: @user.id, service_id: @service.sample).save(validate: false)
      end
    end

    # user can see the project that has the highest number of bids
    # i.e. what individual project has been bid on the most and how many bids

    get "/api/v1/projects/most_bid_project"

    expect(response).to be_success
    bidz = JSON.parse(response.body)

    most_bid = bidz.first
    least_bid = bidz.last
    # take off the .first from the sql query to allow for more than one key/value to be passed into the test for count checking

    expect(most_bid.count).to be > least_bid.count
    expect(most_bid.name).to be String

  end
end









#
