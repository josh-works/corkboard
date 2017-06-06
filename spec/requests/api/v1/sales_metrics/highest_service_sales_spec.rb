require 'rails_helper'

RSpec.describe 'user can call api' do

  it "and see the service with the highest sales" do
    100.times do |n|
      User.new(first_name: "Burt", last_name: "Reynolds", zipcode: "80203", phone_number: "5555554", email: "a#{n}@a.com", password: "a").save(validate: false)
      user = User.last
      Pro.new(first_name: "Bob", last_name: "Ross", zipcode: "80203", phone_number: "5555555", email: "b#{n}@b.com", password: "b").save(validate: false)
      pro = Pro.last
      pro.create_pro_service(service_ids: [rand(1..3)], radius: 10)
      Project.new(status: :completed, zipcode: "80203", recurring: false, description: "MOW MY LAWN", timeline: 'ASAP', requester_id: user.id, service_id: rand(1..3)).save(validate: false)
      @project = Project.last
      Bid.new(user_id: pro.id, project_id: @project.id, amount: rand(30..300).to_s, comment: "I WILL MOW YOUR LAWN").save(validate: false)
    end
    require "pry"; binding.pry

    get "/api/v1/sales_metrics/highest_service_sales"

    expect(response).to be_success
    services = JSON.parse(response.body)

    # max_cities = city_revenues.find_all {|c_r| c_r[1] == city_revenues.first.last}
    # max_cities = max_cities.map {|c_r| c_r.first}
    #
    # low_cities = city_revenues.find_all {|c_r| c_r[1] == city_revenues.last.last}
    # low_cities = low_cities.map {|c_r| c_r.first}
    #
    # expect(cities).to be_an(Array)
    # expect(cities.count).to eq(limit)
    # expect(max_cities.include?(cities.first)).to be true
    # expect(low_cities.include?(cities.last)).to be true
    # expect(city_revenues.first.last).to be > (city_revenues.last.last)
  end
end
