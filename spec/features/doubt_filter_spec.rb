require 'rails_helper'

RSpec.describe "/doubts", type: :view do
  before do
    @params_title = ' | 医薬品情報管理システム'
    FactoryBot.create_list(:doubt, 5)
    @doubt = Doubt.first
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
      fill_in "name",	with: @doubt.name
      click_button "検索"
      expect(page).to have_field "name", with: @doubt.name
      expect(page).to have_content @doubt.title
      expect(page).to have_content @doubt.doctor
      expect(page).to have_content @doubt.detail
      expect(page).to have_content @doubt.report_staff
    end
  end


end