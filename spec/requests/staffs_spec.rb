require 'rails_helper'


RSpec.describe StaffsController, type: :request do
  before do
    @params_title = ' | 医薬品情報管理システム'
    @staff = FactoryGirl.create(:staff)
  end

  describe "GET /staffs" do
    context 'staffs data exists' do
      it "returns http success" do
        is_expected.to eq 200
        assert_select "title",  "マスタ管理（職員名）#{@params_title}"
      end
      it 'show medicine data' do
        is_expected.to eq 200
        expect(response.body).to include @staff.name
      end
    end
    context 'staffs data no exists' do
      it 'show no data' do
        @staff.destroy
        is_expected.to eq 200        
        expect(response.body).not_to include @staff.name
      end
    end
  end

  describe "GET /staffs/new" do
    it "returns http success" do
      is_expected.to eq 200
      assert_select "title",  "マスタ管理（職員名）#{@params_title}"
    end
  end

  describe "GET /staffs/1/edit" do
    it "returns http success" do
      is_expected.to eq 200
      assert_select "title",  "マスタ管理（職員名）#{@params_title}"
    end
    it "show edit data" do
      is_expected.to eq 200
      expect(response.body).to include @staff.name
    end
  end

  describe "DELETE /staffs/1/destroy" do
    it "returns http success" do
      is_expected.to eq 302
    end
    it "delete staff data" do
      expect do
        is_expected.to eq 302
      end.to change(Staff, :count).by(-1)
    end
    it "redirect to home" do
      is_expected.to eq 302
      expect(response).to redirect_to("/staffs")
    end
  end
end