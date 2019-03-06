class MedicinesController < ApplicationController
  def home

  end

  def new
    @medicine = Medicine.new
  end
  
end
