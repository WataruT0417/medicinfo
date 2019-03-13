require 'rails_helper'

RSpec.describe Staff, type: :model do
  before do
    @staff = FactoryGirl.build(:staff)
  end

  shared_examples 'Staff-model respond to attribute or method' do
    it { expect(@staff).to respond_to(:name) }
  end

  describe 'validations' do
    describe 'presence' do
      it 'name' do
        @staff.name = " "
        expect(@staff).not_to be_valid
      end
    end
    describe 'length' do
      it 'name' do
        @staff.name = "a" * 101
        expect(@staff).not_to be_valid
      end
    end
  end
end
