require 'rails_helper'

RSpec.describe "/medicines", type: :view do
  before do
    @params_title = ' | 医薬品情報管理システム'
    FactoryBot.create_list(:medicine, 5)
    @medicine = Medicine.first
  end

  describe "/medicines" do
    it "valid filter" do
      visit "/medicines"
      expect(assigns(:name)).to be nil  
      expect(assigns(:title)).to be nil  
      expect(assigns(:reported_at)).to be nil  
      expect(assigns(:request_staff)).to be nil  
      expect(assigns(:detail)).to be nil 
      expect(assigns(:source)).to be nil 
      expect(assigns(:report_staff)).to be nil 
      fill_in "name",	with: @medicine.name
      click_button "検索"
      expect(page).to have_field "name", with: @medicine.name
      expect(page).to have_content @medicine.title
      expect(page).to have_content @medicine.request_staff
      expect(page).to have_content @medicine.detail
      expect(page).to have_content @medicine.source
      expect(page).to have_content @medicine.report_staff
    end
  end


end