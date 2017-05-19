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

  describe 'Attributes' do
    it { expect(project).to respond_to(:status) }
    it { expect(project).to respond_to(:zipcode) }
    it { expect(project).to respond_to(:recurring) }
    it { expect(project).to respond_to(:timeline) }
    it { expect(project).to respond_to(:description) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with([:open, :accepted, :closed]) }
    it 'is open by default' do
      expect(Project.new.status).to eq('open')
    end

    it { should define_enum_for(:timeline).with(['ASAP',
                                                 'Within 2 Weeks',
                                                 'Within 2 Months',
                                                 'Whenever']) }
    it 'is ASAP by default' do
      expect(Project.new.timeline).to eq('ASAP')
    end
  end

  describe 'ActiveRecord Associations' do
    it { expect(project).to belong_to(:requester) }
    it { expect(project).to belong_to(:service) }
  end

end
