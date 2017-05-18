require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe 'ActiveModel validations' do
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:last_name) }
    it { expect(user).to validate_presence_of(:zipcode) }
    it { expect(user).to validate_presence_of(:phone_number) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email) }
  end

  describe 'Attributes' do
    it { expect(user).to respond_to(:first_name) }
    it { expect(user).to respond_to(:last_name) }
    it { expect(user).to respond_to(:zipcode) }
    it { expect(user).to respond_to(:phone_number) }
    it { expect(user).to respond_to(:email) }
  end

  describe 'ActiveRecord Associations' do
    it { expect(user).to have_many(:user_roles) }
    it { expect(user).to have_many(:roles) }
    it { expect(user).to have_many(:requested_projects).with_foreign_key('requester_id') }
  end
end
