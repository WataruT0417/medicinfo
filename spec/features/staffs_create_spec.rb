require 'rails_helper'

RSpec.describe StaffsController, type: :feature do
  
  before do
    @params_title = ' | 医薬品情報管理システム'
    @staff = FactoryBot.build(:staff)
    visit "/staffs/new"
  end

  scenario 'valid create staffs data' do
    fill_in "name", with: @staff.name
    expect { click_button '登録' }.to change(Staff, :count)
  end

  scenario 'invalid create staffs data' do
    fill_in "name", with: " "
    click_button '登録'
    expect(page).to have_content("can't be blank")
  end

end