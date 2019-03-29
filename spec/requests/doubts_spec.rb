require 'rails_helper'


RSpec.describe DoubtsController, type: :request do
  before do
    @params_title = ' | 医薬品情報管理システム'
    @doubt = FactoryBot.create(:doubt)
  end

  describe "GET /doubts" do
    context 'doubt data exists' do
      it "returns http success" do
        is_expected.to eq 200
      end
      it 'show doubt data' do
        is_expected.to eq 200
        expect(response.body).to include @doubt.name
        expect(response.body).to include @doubt.title
        expect(response.body).to include @doubt.reported_at.to_s
        expect(response.body).to include @doubt.doctor
        expect(response.body).to include @doubt.detail
        expect(response.body).to include @doubt.report_staff
      end
    end
    context 'doubt data no exists' do
      it 'show no data' do
        @doubt .destroy
        is_expected.to eq 200        
        expect(response.body).not_to include @doubt.name
        expect(response.body).not_to include @doubt.title
        expect(response.body).not_to include @doubt.reported_at.to_s
        expect(response.body).not_to include @doubt.doctor
        expect(response.body).not_to include @doubt.detail
      end
    end
  end

  describe "GET /doubts/new" do
    it "returns http success" do
      is_expected.to eq 200
    end
  end

  describe "GET /doubts#filter" do
    it "returns http success" do
      subject {get :filter, @doubt }
      is_expected.to eq 200
    end
    it "show filter data" do
      subject {get :filter, @doubt }
      is_expected.to eq 200
      expect(response.body).to include @doubt.name
      expect(response.body).to include @doubt.title
      expect(response.body).to include @doubt.reported_at.to_s
      expect(response.body).to include @doubt.doctor
      expect(response.body).to include @doubt.detail
      expect(response.body).to include @doubt.report_staff
    end
  end

  #describe "GET /doubts/1/edit" do
  describe "GET #edit" do
    it "returns http success" do
      get "/doubts/#{@doubt.id}/edit"
      is_expected.to eq 200
    end
    it "show edit data" do
      get "/doubts/#{@doubt.id}/edit"
      is_expected.to eq 200
      expect(response.body).to include @doubt.name
      expect(response.body).to include @doubt.title
      expect(response.body).to include @doubt.reported_at.to_s
      expect(response.body).to include @doubt.doctor
      expect(response.body).to include @doubt.detail
      expect(response.body).to include @doubt.report_staff
    end
  end

  describe "DELETE /doubts/1/destroy" do
    it "returns http success" do
      is_expected.to eq 302
    end
    it "delete doubt data" do
      expect do
        is_expected.to eq 302
      end.to change(Doubt, :count).by(-1)
    end
    it "redirect to home" do
      is_expected.to eq 302
      expect(response).to redirect_to("/doubts")
    end
  end
end