require 'rails_helper'

RSpec.describe ReactionsController, type: :feature do
  
  before do
    @params_title = ' | 医薬品情報管理システム'
    @reaction = FactoryGirl.build(:reaction)
    visit "/reactions/new"
  end

  scenario 'valid create reaction data' do
    fill_in "name", with: @reaction.name
    fill_in "title", with: @reaction.title
    fill_in "reported_at", with: @reaction.reported_at
    fill_in "doctor", with: @reaction.doctor
    fill_in "patient_id", with: @reaction.patient_id
    fill_in "patient_name", with: @reaction.patient_name
    fill_in "detail", with: @reaction.detail
    fill_in "report_staff", with: @reaction.report_staff
    expect { click_button '登録' }.to change(Reaction, :count)
  end

  scenario 'invalid create reaction data' do
    fill_in "name", with: " "
    fill_in "title", with: " "
    fill_in "reported_at", with: @reaction.reported_at
    fill_in "doctor", with: @reaction.doctor
    fill_in "patient_id", with: @reaction.patient_id
    fill_in "patient_name", with: @reaction.patient_name
    fill_in "detail", with: @reaction.detail
    fill_in "report_staff", with: @reaction.report_staff
    click_button '登録'
    expect(page).to have_content("can't be blank")
  end

end