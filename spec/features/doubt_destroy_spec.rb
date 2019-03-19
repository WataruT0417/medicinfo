require 'rails_helper'

RSpec.describe DoubtsController, type: :feature do

  before do
    @doubt = FactoryGirl.create(:doubt)
    visit "/doubts"
  end

  scenario 'valid destroy doubt' do
    expect { click_on "destroy_#{@doubt.id}" }.to change(Doubt, :count)
  end  
end