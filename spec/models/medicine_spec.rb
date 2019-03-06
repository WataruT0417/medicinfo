RSpec.describe Medicine, type: :model do
  describe 'Create Medicine Data' do
    before do
      @medicine = FactoryGirl.build(:medicine)
    end
    it 'valid' do
      expect(@medicine).to be_valid
    end
    it 'title should be present' do
      @medicine.title = ' '
      expect(@medicine).not_to be_valid
    end
    it 'name should be present' do
      @medicine.name = ' '
      expect(@medicine).not_to be_valid
    end
  end
end
