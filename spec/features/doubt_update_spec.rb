require 'rails_helper'

RSpec.describe DoubtsController, type: :feature do

  before do
    @params_title = ' | 医薬品情報管理システム'
    @doubt = FactoryGirl.create(:doubt) 
    visit "/doubts/#{@doubt.id}/edit"
  end

  scenario 'valid update doubt data' do
    expect { click_button '修正' }.not_to change(Doubt, :count)
  end

  scenario 'invalid update doubt data' do
    fill_in "name", with: " "
    fill_in "title", with: " "
    click_button '修正'
    expect(page).to have_content("can't be blank")
    expect(@doubt.reload.name).not_to eq " "
    expect(@doubt.reload.title).not_to eq " "
    fill_in "name", with: "a" * 101
    click_button '修正'
    expect(page).to have_content("is too long")
    expect(@doubt.reload.name).not_to eq "a" * 101
  end
  
end