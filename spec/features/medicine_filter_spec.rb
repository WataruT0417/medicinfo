require 'rails_helper'

RSpec.describe "/medicines", type: :view do
  before do
    @params_title = ' | 医薬品情報管理システム'
    @medicine = FactoryGirl.create_list(:medicine, 5)
  end

  describe "/medicines" do
    it "valid filter" do
      expect(assigns(:name)).to be nil  
      expect(assigns(:title)).to be nil  
      expect(assigns(:code)).to be nil  
      expect(assigns(:reported_at)).to be nil  
      expect(assigns(:approval)).to be nil 
    end
  end


end