require 'rails_helper'

RSpec.describe Role, type: :model do

  it 'has a valid factory' do
    expect(build(:admin)).to be_valid
    expect(build(:pro)).to be_valid
    expect(build(:customer)).to be_valid
  end

  let(:role) { build(:customer) }

  describe 'ActiveModel Validations' do
    it { expect(role).to validate_presence_of(:name) }
  end

  describe 'Attributes' do
    it { expect(role).to respond_to(:name)}
  end

  describe 'ActiveRecord Associations' do
    it { expect(role).to have_many(:user_roles) }
    it { expect(role).to have_many(:users) }
  end
end
