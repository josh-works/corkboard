require 'rails_helper'

RSpec.describe 'a logged pro can see available projects that match its services' do
  let!(:industry)  { create(:industry, name: 'Home Improvement')}
  let!(:category)  { create(:category, name: 'Lawn & Garden', industry: industry) }
  let!(:service_1) { create(:service, category: category) }
  let!(:service_2) { create(:service, name: 'Gardening', category: category) }
  let!(:project_1) { create(:project, service: service_1) }
  let!(:project_2) { create(:project, service: service_2) }
  let!(:pro) { (create(:pro_user)) }

  it 'visits find new projects page and and sees a list of projects that match services' do
    byebug
  end
end
