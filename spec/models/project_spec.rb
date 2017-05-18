require 'rails_helper'

RSpec.describe Project, type: :model do

  it 'has a valid factory' do
    expect(build(:project)).to be_valid
  end

  let(:project) { build(:project) }

  describe 'ActiveModel validations' do
    it { expect(project).to validate_presence_of(:status) }
    it { expect(project).to validate_presence_of(:zipcode) }
    it { expect(project).to validate_presence_of(:timeline) }
    it { expect(project).to validate_presence_of(:description) }
  end

  describe 'ActiveRecord Attributes' do
    it { expect(project).to respond_to(:status) }
    it { expect(project).to respond_to(:zipcode) }
    it { expect(project).to respond_to(:recurring) }
    it { expect(project).to respond_to(:timeline) }
    it { expect(project).to respond_to(:description) }
  end

  describe 'ActiveRecord Associations' do
  end

end