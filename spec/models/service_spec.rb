require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'has a valid factory' do
    expect(build(:service)).to be_valid
  end

  let(:service) { build(:service) }

  describe 'ActiveModel validations' do
    before do
      Service.skip_callback(:validation, :before, :generate_slug)
    end
    after do
      Service.set_callback(:validation, :before, :generate_slug)
    end

    it { expect(service).to validate_presence_of(:name) }
    it { expect(service).to validate_presence_of(:category) }
    it { expect(service).to validate_presence_of(:slug) }
    it { expect(service).to validate_uniqueness_of(:slug) }
  end

  describe 'Attributes' do
    it { expect(service).to respond_to(:name) }
    it { expect(service).to respond_to(:slug) }
  end

  describe 'ActiveRecord Associations' do
    it { expect(service).to belong_to(:category) }
    it { expect(service).to have_many(:projects) }
    it { expect(service).to delegate_method(:industry).to(:category)}
  end

  describe 'Callbacks' do
    let(:service) { create(:service) }

    it { expect(service).to callback(:generate_slug).before(:validation) }
  end

  describe 'Instance methods' do
    context 'responds to its methods' do
      it { expect(service).to respond_to(:generate_slug) }
      it { expect(service).to respond_to(:to_param) }
    end

    context 'executes methods properly' do
      context '#generate_slug' do
        it 'paramaterizes name of industry' do 
          expect(service.generate_slug).to eq(service.name.parameterize)
        end
      end

      context '#to_param' do
        it 'returns the slug' do
          expect(service.to_param).to eq("#{service.slug}")
        end
      end
    end
  end

  describe 'Class methods', Service do
    let(:service) { create(:service) }

    context 'it responds to its methods' do
      it { expect(Service).to respond_to(:find) }
    end

    context 'executes methods properly' do
      context '.find' do
        it 'can find by id' do
          expect(Service.find(service.id)).to eq(service)
        end

        it 'can find by slug' do
          expect(Service.find(service.slug)).to eq(service)
        end
      end
    end
  end
end
