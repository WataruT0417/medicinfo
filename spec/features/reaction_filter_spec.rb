require 'rails_helper'

RSpec.describe "/reactions", type: :view do
  before do
    @params_title = ' | 医薬品情報管理システム'
    FactoryBot.create_list(:reaction, 5)
    @reaction = Reaction.first
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
      fill_in "name",	with: @reaction.name
      click_button "検索"
      expect(page).to have_field "name", with: @reaction.name
      expect(page).to have_content @reaction.title
      expect(page).to have_content @reaction.doctor
      expect(page).to have_content @reaction.patient_id
      expect(page).to have_content @reaction.patient_name
      expect(page).to have_content @reaction.detail
      expect(page).to have_content @reaction.report_staff
    end
  end


end