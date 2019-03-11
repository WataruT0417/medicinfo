require 'rails_helper'

RSpec.describe Medicine, type: :model do
  before do
    @medicine = FactoryGirl.build(:medicine)
  end

  shared_examples 'Medicine-model respond to attribute or method' do
    it { expect(@medicine).to respond_to(:id) }
    it { expect(@medicine).to respond_to(:name) }
    it { expect(@medicine).to respond_to(:title) }
    it { expect(@medicine).to respond_to(:code) }
    it { expect(@medicine).to respond_to(:reported_at) }
  end

  describe 'validations' do
    describe 'presence' do
      it 'name' do
        @medicine.name = " "
        expect(@medicine).not_to be_valid
      end
      it 'title' do
        @medicine.title = " "
        expect(@medicine).not_to be_valid
      end
    end
    describe 'length' do
      it 'name' do
        @medicine.name = "a" * 101
        expect(@medicine).not_to be_valid
      end
      it 'code' do
        @medicine.code = "a" * 21
        expect(@medicine).not_to be_valid
      end
    end
  end

end
