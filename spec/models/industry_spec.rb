require 'rails_helper'

RSpec.describe Industry, type: :model do

  it 'has a valid factory' do
    expect(build(:industry)).to be_valid
  end

  let(:industry) { build(:industry) }

  describe 'ActiveModel validations' do
    it { expect(industry).to validate_presence_of(:name) }
    it { expect(industry).to validate_uniqueness_of(:name) }
  end

  describe 'Attributes' do
    it { expect(industry).to respond_to(:name) }
  end

  describe 'ActiveRecord Associations' do
    it { expect(industry).to have_many(:categories) }
    it { expect(industry).to have_many(:services) }
  end

end
