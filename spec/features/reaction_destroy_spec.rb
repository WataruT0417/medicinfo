require 'rails_helper'

RSpec.describe ReactionsController, type: :feature do

  before do
    @reaction = FactoryBot.create(:reaction)
    visit "/reactions"
  end

  scenario 'valid destroy reaction' do
    expect { click_on "destroy_#{@reaction.id}" }.to change(Reaction, :count)
  end  
end