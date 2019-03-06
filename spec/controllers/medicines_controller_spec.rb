require 'rails_helper'

RSpec.describe MedicinesController, type: :request do

  describe "GET /medicines" do
    before do
      @params_title = ' | 医薬品情報管理システム'
    end
    it "returns http success" do
      is_expected.to eq 200
      assert_select "title",  "医薬品情報#{@params_title}"
    end
  end

  describe "GET /medicines/new" do
    before do
      @params_title = ' | 医薬品情報管理システム'
    end
    it "returns http success" do
      is_expected.to eq 200
      assert_select "title",  "医薬品情報#{@params_title}"
    end
  end
end