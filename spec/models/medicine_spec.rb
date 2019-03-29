require 'rails_helper'

RSpec.describe Medicine, type: :model do
  before do
    @medicine = FactoryBot.build(:medicine)
  end

  shared_examples 'Medicine-model respond to attribute or method' do
    it { expect(@medicine).to respond_to(:id) }
    it { expect(@medicine).to respond_to(:name) }
    it { expect(@medicine).to respond_to(:title) }
    it { expect(@medicine).to respond_to(:reported_at) }
    it { expect(@medicine).to respond_to(:request_staff) }
    it { expect(@medicine).to respond_to(:detail) }
    it { expect(@medicine).to respond_to(:source) }
    it { expect(@medicine).to respond_to(:report_staff) }
    it { expect(@medicine).to respond_to(:approval_flg) }
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
      it 'request_staff' do
        @medicine.request_staff = "a" * 21
        expect(@medicine).not_to be_valid
      end
      it 'report_staff' do
        @medicine.report_staff = "a" * 21
        expect(@medicine).not_to be_valid
      end
    end
  end

end
