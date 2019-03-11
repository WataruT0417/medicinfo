class MedicinesController < ApplicationController
  def home
    @medicine = Medicine.new
    #@medicines = Medicine.all.order(id: "DESC")
    @medicines = Medicine.paginate(page: params[:page], per_page: 10).order('id desc')
  end

  def new
    @medicine = Medicine.new
  end
  
  def create
    @medicine = Medicine.new(medicine_params)
    if @medicine.save
      flash[:success] = "新規登録が完了しました。"
      redirect_to :action => 'home'
    else
      render 'new'
    end
  end

  def edit
    @medicine = Medicine.find(params[:id])
  end

  def update
    @medicine = Medicine.find(params[:id])
    if @medicine.update_attributes(medicine_params)
      flash[:success] = "修正が完了しました。"
      redirect_to :action => 'home'
    else
      render 'edit'
    end
  end

  def medicine_params
    params.require(:medicine).permit(:name, :title, :code, :reported_at)
  end
end
