require 'rails_helper'


RSpec.describe MedicinesController, type: :request do
  before do
    @params_title = ' | 医薬品情報管理システム'
  end

  describe "GET /masters" do
    it "returns http success" do
      is_expected.to eq 200
      assert_select "title",  "マスタ管理#{@params_title}"
    end
    it 'show btn data' do
      is_expected.to eq 200
      assert_select "a[href=?]", '/staffs', count: 1
    end
  end

end