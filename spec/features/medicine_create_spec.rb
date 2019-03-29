require 'rails_helper'

RSpec.describe MedicinesController, type: :feature do
  
  before do
    @params_title = ' | 医薬品情報管理システム'
    @medicine = FactoryBot.build(:medicine)
    visit "/medicines/new"
  end

  scenario 'valid create medicine data' do
    fill_in "name", with: @medicine.name
    fill_in "title", with: @medicine.title
    fill_in "reported_at", with: @medicine.reported_at
    fill_in "request_staff", with: @medicine.request_staff
    fill_in "detail", with: @medicine.detail
    fill_in "source", with: @medicine.source
    select @medicine.report_staff, from: "report_staff"
    expect { click_button '登録' }.to change(Medicine, :count)
  end

  scenario 'invalid create medicine data' do
    fill_in "name", with: " "
    fill_in "title", with: " "
    fill_in "reported_at", with: @medicine.reported_at
    fill_in "request_staff", with: @medicine.request_staff
    fill_in "detail", with: @medicine.detail
    fill_in "source", with: @medicine.source
    select @medicine.report_staff, from: "report_staff"
    click_button '登録'
    expect(page).to have_content("can't be blank")
  end

end