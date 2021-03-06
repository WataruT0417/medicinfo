require 'rails_helper'


RSpec.describe MedicinesController, type: :request do
  before do
    @params_title = ' | 医薬品情報管理システム'
    @medicine = FactoryBot.create(:medicine)
  end

  describe "GET /medicines" do
    context 'medicine data exists' do
      it "returns http success" do
        is_expected.to eq 200
      end
      it 'show medicine data' do
        is_expected.to eq 200
        expect(response.body).to include @medicine.name
        expect(response.body).to include @medicine.title
        expect(response.body).to include @medicine.reported_at.to_s
        expect(response.body).to include @medicine.request_staff
        expect(response.body).to include @medicine.detail
        expect(response.body).to include @medicine.source
        expect(response.body).to include @medicine.report_staff
      end
    end
    context 'medicine data no exists' do
      it 'show no data' do
        @medicine .destroy
        is_expected.to eq 200        
        expect(response.body).not_to include @medicine.name
        expect(response.body).not_to include @medicine.title
        expect(response.body).not_to include @medicine.reported_at.to_s
        expect(response.body).not_to include @medicine.request_staff
        expect(response.body).not_to include @medicine.detail
        expect(response.body).not_to include @medicine.source
        expect(response.body).not_to include @medicine.report_staff
      end
    end
  end

  describe "GET /medicines/new" do
    it "returns http success" do
      is_expected.to eq 200
    end
  end

  describe "GET #filter" do
    it "returns http success" do
      subject {get :filter, @medicine }
      is_expected.to eq 200
    end
    it "show filter data" do
      subject {get :filter, @medicine }
      is_expected.to eq 200
      expect(response.body).to include @medicine.name
      expect(response.body).to include @medicine.title
      expect(response.body).to include @medicine.reported_at.to_s
      expect(response.body).to include @medicine.request_staff
      expect(response.body).to include @medicine.detail
      expect(response.body).to include @medicine.source
      expect(response.body).to include @medicine.report_staff
    end
  end

  describe "GET /medicines/1/edit" do
    it "returns http success" do
      is_expected.to eq 200
    end
    it "show edit data" do
      is_expected.to eq 200
      expect(response.body).to include @medicine.name
      expect(response.body).to include @medicine.title
      expect(response.body).to include @medicine.reported_at.to_s
      expect(response.body).to include @medicine.request_staff
      expect(response.body).to include @medicine.detail
      expect(response.body).to include @medicine.source
      expect(response.body).to include @medicine.report_staff
    end
  end

  describe "DELETE /medicines/1/destroy" do
    it "returns http success" do
      is_expected.to eq 302
    end
    it "delete medicine data" do
      expect do
        is_expected.to eq 302
      end.to change(Medicine, :count).by(-1)
    end
    it "redirect to home" do
      is_expected.to eq 302
      expect(response).to redirect_to("/medicines")
    end
  end
end