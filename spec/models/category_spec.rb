require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end

  let(:category) { build(:category) }

  describe 'ActiveModel validations' do
    before do
      Category.skip_callback(:validation, :before, :generate_slug)
    end
    after do
      Category.set_callback(:validation, :before, :generate_slug)
    end
    it { expect(category).to validate_presence_of(:name) }
    it { expect(category).to validate_presence_of(:industry) }
    it { expect(category).to validate_presence_of(:slug) }
    it { expect(category).to validate_uniqueness_of(:slug) }
  end

  describe 'Attributes' do
    it { expect(category).to respond_to(:name) }
    it { expect(category).to respond_to(:slug) }
  end

  describe 'ActiveRecord Associations' do
    it { expect(category).to belong_to(:industry) }
    it { expect(category).to have_many(:services) }
  end

  describe 'Callbacks' do
    let(:category) { create(:category) }

    it { expect(category).to callback(:generate_slug).before(:validation) }
  end

  describe 'Instance methods' do
    context 'responds to its methods' do
      it { expect(category).to respond_to(:generate_slug) }
      it { expect(category).to respond_to(:to_param) }
    end

    context 'executes its methods properly' do
      context '#generate_slug' do
        it 'paramaterizes name of category' do
          expect(category.generate_slug).to eq(category.name.parameterize)
        end
      end

      context '#to_param' do
        it 'returns the slug' do
          expect(category.to_param).to eq("#{category.slug}")
        end
      end
    end
  end

  describe 'Class methods', Category do
    let(:category) { create(:category) }

    context 'responds to its methods' do
      it { expect(Category).to respond_to(:find) }
    end

    context 'executes methods properly' do
      context '.find' do
        it 'can find by id' do
          expect(Category.find(category.id)).to eq(category)
        end

        it 'can find by slug' do
          expect(Category.find(category.slug)).to eq(category)
        end
      end
    end
  end
end
