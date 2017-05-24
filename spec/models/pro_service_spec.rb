require 'rails_helper'

RSpec.describe ProService, type: :model do

  it 'has a valid factory' do
    expect(build(:pro_service)).to be_valid
  end

  let(:pro_service) { build(:pro_service) }

  describe 'Attributes' do
    it { expect(pro_service).to respond_to(:service_ids)}
  end

  describe 'ActiveRecord Associations' do
    it { expect(pro_service).to belong_to(:pro).with_foreign_key(:user) }
  end
end
