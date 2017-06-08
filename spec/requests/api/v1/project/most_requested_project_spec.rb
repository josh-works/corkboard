require 'rails_helper'

describe 'user can call api' do

  xit "and see the most requested project" do

    5.times do |n|
      User.new(first_name: "Burt", last_name: "Reynolds", zipcode: "80203", phone_number: "5555554", email: "a#{n}@a.com", password: "a").save(validate: false)
      @user = User.last

      5.times do |m|
        Project.new(status: :completed, zipcode: "80203", recurring: false, description: "MOW MY LAWN", timeline: 'ASAP', requester_id: @user.id, service_id: @service.sample).save(validate: false)
      end
    end

    get "/api/v1/projects/most_requested_project"

    expect(response).to be_success
    projects = JSON.parse(response.body, :quirks_mode => true)
    most_requested = projects.first
    least_requested = projects.last

    expect(most_requested.count).to be > projects.last.count
    expect(most_requested.name).to be String

  end
end









#
