require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'has a valid factory' do
    expect(build(:service)).to be_valid
  end

  let(:service) { build(:service) }

  describe 'ActiveModel validations' do
    it { expect(service).to validate_presence_of(:name) }
    it { expect(service).to validate_presence_of(:category) }
  end

  describe 'Attributes' do
    it { expect(service).to respond_to(:name) }
  end

  describe 'ActiveRecord Associations' do
    it { expect(service).to belong_to(:category) }
    it { expect(service).to have_many(:projects) }
  end

end
