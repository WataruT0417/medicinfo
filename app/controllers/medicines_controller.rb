class MedicinesController < ApplicationController
  def home
    @medicine = Medicine.new
  end

  def new
    @medicine = Medicine.new
  end
  
end
