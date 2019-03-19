require 'rails_helper'

RSpec.describe "/reactions", type: :view do
  before do
    @params_title = ' | 医薬品情報管理システム'
    @reaction = FactoryGirl.create_list(:reaction, 5)
  end

  describe "/reactions" do
    it "valid filter" do
      visit "/reactions"
      expect(assigns(:name)).to be nil
      expect(assigns(:title)).to be nil
      expect(assigns(:reported_at)).to be nil
      expect(assigns(:doctor)).to be nil
      expect(assigns(:patient_id)).to be nil
      expect(assigns(:patient_name)).to be nil
      expect(assigns(:detail)).to be nil
      expect(assigns(:report_staff)).to be nil
      fill_in "name",	with: "テスト医薬品1"
      click_button "検索"
      expect(page).to have_field "name", with: "テスト医薬品1"
      expect(page).to have_content "テストタイトル1"
      expect(page).to have_content "テスト 医師1"
      expect(page).to have_content "20001"
      expect(page).to have_content "テスト 患者1"
      expect(page).to have_content "詳細テスト1"
      expect(page).to have_content "テスト 報告者1"
    end
  end


end