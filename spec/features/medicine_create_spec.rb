require 'rails_helper'

RSpec.describe MedicinesController, type: :feature do
  
  before do
    @params_title = ' | 医薬品情報管理システム'
    @medicine = FactoryGirl.build(:medicine)
    visit "/medicines/new"
  end

  scenario 'valid create medicine data' do
    fill_in "name", with: @medicine.name
    fill_in "title", with: @medicine.title
    fill_in "code", with: @medicine.code
    fill_in "reported_at", with: @medicine.reported_at
    expect { click_button '登録' }.to change(Medicine, :count)
  end

  scenario 'invalid create medicine data' do
    fill_in "name", with: " "
    fill_in "title", with: " "
    fill_in "code", with: @medicine.code
    fill_in "reported_at", with: @medicine.reported_at
    click_button '登録'
    expect(page).to have_content("can't be blank")
  end

end