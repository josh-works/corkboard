require 'rails_helper'

RSpec.describe UserRole, type: :model do

  it 'has a valid factory' do
    expect(build(:user_role)).to be_valid
  end

  let(:user_role) { build(:user_role) }

  describe 'ActiveModel Validations' do
    it { expect(user_role).to validate_presence_of(:user) }
    it { expect(user_role).to validate_presence_of(:role) }
  end

  describe 'Attributes' do
    it { expect(user_role).to respond_to(:user) }
    it { expect(user_role).to respond_to(:role) }
  end

  describe 'ActiveRecord Associations' do
    it {expect(user_role).to belong_to(:user) }
    it {expect(user_role).to belong_to(:role) }
  end

end
