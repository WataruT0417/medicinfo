require 'rails_helper'

RSpec.describe MedicinesController, type: :feature do

  before do
    @medicine = FactoryBot.create(:medicine)
    visit "/medicines"
  end

  scenario 'valid destroy medicine' do
    expect { click_on "destroy_#{@medicine.id}" }.to change(Medicine, :count)
  end  
end