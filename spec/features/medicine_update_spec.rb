require 'rails_helper'

RSpec.describe MedicinesController, type: :feature do

  before do
    @params_title = ' | 医薬品情報管理システム'
    @medicine = FactoryGirl.create(:medicine) 
    visit "/medicines/#{@medicine.id}/edit"
  end

  scenario 'valid update medicine data' do
    expect { click_button '修正' }.not_to change(Medicine, :count)
  end

  scenario 'invalid update medicine data' do
    fill_in "name", with: " "
    fill_in "title", with: " "
    click_button '修正'
    expect(page).to have_content("can't be blank")
    expect(@medicine.reload.name).not_to eq " "
    expect(@medicine.reload.title).not_to eq " "
    fill_in "name", with: "a" * 101
    click_button '修正'
    expect(page).to have_content("is too long")
    expect(@medicine.reload.name).not_to eq "a" * 101
  end
  
end