require 'rails_helper'

RSpec.describe StaffsController, type: :feature do

  before do
    @params_title = ' | 医薬品情報管理システム'
    @staff = FactoryGirl.create(:staff) 
    visit "/staffs/#{@staff.id}/edit"
  end

  scenario 'valid update staff data' do
    expect { click_button '修正' }.not_to change(Staff, :count)
  end

  scenario 'invalid update staff data' do
    fill_in "name", with: " "
    click_button '修正'
    expect(page).to have_content("can't be blank")
    expect(@staff.reload.name).not_to eq " "
    fill_in "name", with: "a" * 101
    click_button '修正'
    expect(page).to have_content("is too long")
    expect(@staff.reload.name).not_to eq "a" * 101
  end
  
end