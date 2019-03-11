require 'rails_helper'


RSpec.describe MedicinesController, type: :request do
  before do
    @params_title = ' | 医薬品情報管理システム'
    @medicine = FactoryGirl.build(:medicine)
  end

  describe "GET /medicines" do
    it "returns http success" do
      is_expected.to eq 200
      assert_select "title",  "医薬品情報#{@params_title}"
    end
  end

  describe "GET /medicines/new" do
    it "returns http success" do
      is_expected.to eq 200
      assert_select "title",  "医薬品情報#{@params_title}"
    end
  end
end