require 'rails_helper'


RSpec.describe ReactionsController, type: :request do
  before do
    @params_title = ' | 医薬品情報管理システム'
    @reaction = FactoryBot.create(:reaction)
  end

  describe "GET /reactions" do
    context 'reaction data exists' do
      it "returns http success" do
        is_expected.to eq 200
      end
      it 'show reaction data' do
        is_expected.to eq 200
        expect(response.body).to include @reaction.name
        expect(response.body).to include @reaction.title
        expect(response.body).to include @reaction.reported_at.to_s
        expect(response.body).to include @reaction.doctor
        expect(response.body).to include @reaction.patient_id
        expect(response.body).to include @reaction.patient_name
        expect(response.body).to include @reaction.detail
        expect(response.body).to include @reaction.report_staff
      end
    end
    context 'reaction data no exists' do
      it 'show no data' do
        @reaction .destroy
        is_expected.to eq 200        
        expect(response.body).not_to include @reaction.name
        expect(response.body).not_to include @reaction.title
        expect(response.body).not_to include @reaction.reported_at.to_s
        expect(response.body).not_to include @reaction.doctor
        expect(response.body).not_to include @reaction.patient_id
        expect(response.body).not_to include @reaction.patient_name
        expect(response.body).not_to include @reaction.detail
        expect(response.body).not_to include @reaction.report_staff
      end
    end
  end

  describe "GET /reactions/new" do
    it "returns http success" do
      is_expected.to eq 200
    end
  end

  describe "GET /reactions#filter" do
    it "returns http success" do
      subject {get :filter, @reaction }
      is_expected.to eq 200
    end
    it "show filter data" do
      subject {get :filter, @reaction }
      is_expected.to eq 200
      expect(response.body).to include @reaction.name
      expect(response.body).to include @reaction.title
      expect(response.body).to include @reaction.reported_at.to_s
      expect(response.body).to include @reaction.doctor
      expect(response.body).to include @reaction.patient_id
      expect(response.body).to include @reaction.patient_name
      expect(response.body).to include @reaction.detail
      expect(response.body).to include @reaction.report_staff
    end
  end

  describe "GET /reactions/1/edit" do
    it "returns http success" do
      is_expected.to eq 200
    end
    it "show edit data" do
      is_expected.to eq 200
      expect(response.body).to include @reaction.name
      expect(response.body).to include @reaction.title
      expect(response.body).to include @reaction.reported_at.to_s
      expect(response.body).to include @reaction.doctor
      expect(response.body).to include @reaction.patient_id
      expect(response.body).to include @reaction.patient_name
      expect(response.body).to include @reaction.detail
      expect(response.body).to include @reaction.report_staff
    end
  end

  describe "DELETE /reactions/1/destroy" do
    it "returns http success" do
      is_expected.to eq 302
    end
    it "delete reaction data" do
      expect do
        is_expected.to eq 302
      end.to change(Reaction, :count).by(-1)
    end
    it "redirect to home" do
      is_expected.to eq 302
      expect(response).to redirect_to("/reactions")
    end
  end
end