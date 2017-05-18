require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end

  let(:category) { build(:category) }

  describe 'ActiveModel validations' do
    it { expect(category).to validate_presence_of(:name) }
    it { expect(category).to validate_presence_of(:industry) }
  end

  describe 'Attributes' do
    it { expect(category).to respond_to(:name) }
  end

  describe 'ActiveRecord Associations' do
    it { expect(category).to belong_to(:industry) }
    it { expect(category).to have_many(:services) }
  end
end
