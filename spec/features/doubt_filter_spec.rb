require 'rails_helper'

RSpec.describe "/doubts", type: :view do
  before do
    @params_title = ' | 医薬品情報管理システム'
    @doubt = FactoryGirl.create_list(:doubt, 5)
  end

  describe "/doubts" do
    it "valid filter" do
      visit "/doubts"
      expect(assigns(:name)).to be nil
      expect(assigns(:title)).to be nil
      expect(assigns(:reported_at)).to be nil
      expect(assigns(:doctor)).to be nil
      expect(assigns(:detail)).to be nil
      expect(assigns(:report_staff)).to be nil
      fill_in "name",	with: "テスト医薬品1"
      click_button "検索"
      expect(page).to have_field "name", with: "テスト医薬品1"
      expect(page).to have_content "テストタイトル1"
      expect(page).to have_content "テスト 医師1"
      expect(page).to have_content "詳細テスト1"
      expect(page).to have_content "テスト 報告者1"
    end
  end


end