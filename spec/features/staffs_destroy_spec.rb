require 'rails_helper'

RSpec.describe StaffsController, type: :feature do

  before do
    @staff = FactoryBot.create(:staff)
    visit "/staffs"
  end

  scenario 'valid destroy medicine' do
    expect { click_on "destroy_#{@staff.id}" }.to change(Staff, :count)
  end  
end