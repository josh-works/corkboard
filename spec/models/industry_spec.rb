require 'rails_helper'

RSpec.describe Industry, type: :model do

  it 'has a valid factory' do
    expect(build(:industry)).to be_valid
  end

  let(:industry) { build(:industry) }

  describe 'ActiveModel validations' do
    before do
      Industry.skip_callback(:validation, :before, :generate_slug)
    end
    after do
      Industry.set_callback(:validation, :before, :generate_slug)
    end

    it { expect(industry).to validate_presence_of(:name) }
    it { expect(industry).to validate_uniqueness_of(:name) }
    it { expect(industry).to validate_presence_of(:slug) }
    it { expect(industry).to validate_uniqueness_of(:slug) }
  end

  describe 'Attributes' do
    it { expect(industry).to respond_to(:name) }
    it { expect(industry).to respond_to(:glyphicon) }
    it { expect(industry).to respond_to(:slug) }
  end

  describe 'ActiveRecord Associations' do
    it { expect(industry).to have_many(:categories) }
    it { expect(industry).to have_many(:services) }
  end

  describe 'callbacks' do
    let(:industry) { create(:industry) }

    it { expect(industry).to callback(:generate_slug).before(:validation) }
  end

  describe 'instance methods' do
    context 'it responds to its methods' do
      it { expect(industry).to respond_to(:generate_slug) }
      it { expect(industry).to respond_to(:to_param) }
    end

    context 'executes methods properly' do
      context '#generate_slug' do
        it 'paramaterizes name of industry' do 
          expect(industry.generate_slug).to eq(industry.name.parameterize)
        end
      end

      context '#to_param' do
        it 'returns the slug' do
          expect(industry.to_param).to eq("#{industry.slug}")
        end
      end
    end
  end

  describe 'class methods', Industry do
    let(:industry) { create(:industry) }

    context 'it responds to its methods' do
      it { expect(Industry).to respond_to(:find) }
    end

    context 'executes methods properly' do
      context '.find' do
        it 'can find by id' do
          expect(Industry.find(industry.id)).to eq(industry)
        end

        it 'can find by slug' do
          expect(Industry.find(industry.slug)).to eq(industry)
        end
      end
    end
  end
end
