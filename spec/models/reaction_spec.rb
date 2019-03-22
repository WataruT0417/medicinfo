require 'rails_helper'

RSpec.describe Reaction, type: :model do
  before do
    @reaction = FactoryGirl.build(:reaction)
  end

  shared_examples 'Reaction-model respond to attribute or method' do
    it { expect(@reaction).to respond_to(:id) }
    it { expect(@reaction).to respond_to(:name) }
    it { expect(@reaction).to respond_to(:title) }
    it { expect(@reaction).to respond_to(:reported_at) }
    it { expect(@reaction).to respond_to(:doctor) }
    it { expect(@reaction).to respond_to(:patient_id) }
    it { expect(@reaction).to respond_to(:patient_name) }
    it { expect(@reaction).to respond_to(:detail) }
    it { expect(@reaction).to respond_to(:report_staff) }
    it { expect(@reaction).to respond_to(:approval_flg) }
  end

  describe 'validations' do
    describe 'presence' do
      it 'name' do
        @reaction.name = " "
        expect(@reaction).not_to be_valid
      end
      it 'title' do
        @reaction.title = " "
        expect(@reaction).not_to be_valid
      end
    end
    describe 'length' do
      it 'name' do
        @reaction.name = "a" * 101
        expect(@reaction).not_to be_valid
      end
      it 'doctor' do
        @reaction.doctor = "a" * 101
        expect(@reaction).not_to be_valid
      end
      it 'patient_id' do
        @reaction.patient_id = "0" * 11
        expect(@reaction).not_to be_valid
      end
      it 'patient_name' do
        @reaction.patient_name = "a" * 101
        expect(@reaction).not_to be_valid
      end
      it 'report_staff' do
        @reaction.report_staff = "a" * 101
        expect(@reaction).not_to be_valid
      end
    end
  end
end
