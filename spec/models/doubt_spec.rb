require 'rails_helper'

RSpec.describe Doubt, type: :model do
  before do
    @doubt = FactoryGirl.build(:doubt)
  end

  shared_examples 'Doubt-model respond to attribute or method' do
    it { expect(@doubt).to respond_to(:id) }
    it { expect(@doubt).to respond_to(:name) }
    it { expect(@doubt).to respond_to(:title) }
    it { expect(@doubt).to respond_to(:reported_at) }
    it { expect(@doubt).to respond_to(:doctor) }
    it { expect(@doubt).to respond_to(:detail) }
    it { expect(@doubt).to respond_to(:report_staff) }
    it { expect(@doubt).to respond_to(:approval_flg) }
  end

  describe 'validations' do
    describe 'presence' do
      it 'name' do
        @doubt.name = " "
        expect(@doubt).not_to be_valid
      end
      it 'title' do
        @doubt.title = " "
        expect(@doubt).not_to be_valid
      end
    end
    describe 'length' do
      it 'name' do
        @doubt.name = "a" * 101
        expect(@doubt).not_to be_valid
      end
      it 'doctor' do
        @doubt.doctor = "a" * 101
        expect(@doubt).not_to be_valid
      end
      it 'report_staff' do
        @doubt.report_staff = "a" * 101
        expect(@doubt).not_to be_valid
      end
    end
  end
end
