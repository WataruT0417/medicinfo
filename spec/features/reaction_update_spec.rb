require 'rails_helper'

RSpec.describe ReactionsController, type: :feature do

  before do
    @params_title = ' | 医薬品情報管理システム'
    @reaction = FactoryBot.create(:reaction) 
    visit "/reactions/#{@reaction.id}/edit"
  end

  scenario 'valid update reaction data' do
    expect { click_button '修正' }.not_to change(Reaction, :count)
  end

  scenario 'invalid update reaction data' do
    fill_in "name", with: " "
    fill_in "title", with: " "
    click_button '修正'
    expect(page).to have_content("can't be blank")
    expect(@reaction.reload.name).not_to eq " "
    expect(@reaction.reload.title).not_to eq " "
    fill_in "name", with: "a" * 101
    click_button '修正'
    expect(page).to have_content("is too long")
    expect(@reaction.reload.name).not_to eq "a" * 101
  end
  
end