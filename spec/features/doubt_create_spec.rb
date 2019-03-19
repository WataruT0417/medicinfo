require 'rails_helper'

RSpec.describe DoubtsController, type: :feature do
  
  before do
    @params_title = ' | 医薬品情報管理システム'
    @doubt = FactoryGirl.build(:doubt)
    visit "/doubts/new"
  end

  scenario 'valid create doubt data' do
    fill_in "name", with: @doubt.name
    fill_in "title", with: @doubt.title
    fill_in "reported_at", with: @doubt.reported_at
    fill_in "doctor", with: @doubt.doctor
    fill_in "detail", with: @doubt.detail
    fill_in "report_staff", with: @doubt.report_staff
    expect { click_button '登録' }.to change(Doubt, :count)
  end

  scenario 'invalid create doubt data' do
    fill_in "name", with: " "
    fill_in "title", with: " "
    fill_in "reported_at", with: @doubt.reported_at
    fill_in "doctor", with: @doubt.doctor
    fill_in "detail", with: @doubt.detail
    fill_in "report_staff", with: @doubt.report_staff
    click_button '登録'
    expect(page).to have_content("can't be blank")
  end

end