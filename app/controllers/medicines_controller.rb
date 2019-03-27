class MedicinesController < ApplicationController

  include MedicinesHelper
  def home
    @medicine = Medicine.new
    @medicines = Medicine.paginate(page: params[:page], per_page: 10).order('id desc').where(
      "name like ?", "%%")
  end

  def new
    @medicine = Medicine.new
  end
  
  def filter
    @medicine = Medicine.new(medicine_params)
    filter = filter_param(@medicine.name, "name", filter = "")
    @medicines = Medicine.paginate(page: params[:page], per_page: 10).order('id desc')
    @medicines = @medicines.where("name like ?", "%#{@medicine.name}%") if @medicine.name.present?
    @medicines = @medicines.where("title like ?", "%#{@medicine.title}%") if @medicine.title.present?
    @medicines = @medicines.where("reported_at like ?", "%#{@medicine.reported_at}%") if @medicine.reported_at.present?
    @medicines = @medicines.where("request_staff like ?", "%#{@medicine.request_staff}%") if @medicine.request_staff.present?
    @medicines = @medicines.where("detail like ?", "%#{@medicine.detail}%") if @medicine.detail.present?
    @medicines = @medicines.where("source like ?", "%#{@medicine.source}%") if @medicine.source.present?
    @medicines = @medicines.where("report_staff like ?", "%#{@medicine.report_staff}%") if @medicine.report_staff.present?
    render 'home'
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

  def destroy
    Medicine.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to :action => 'home'
  end

  def output
    require 'thinreports'
    @medicine = Medicine.find(params[:id])
    report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/medicines_dicard.tlf")

    report.start_new_page
    report.page.item(:reported_at).value(@medicine.reported_at)
    report.page.item(:request_staff).value(@medicine.request_staff)
    report.page.item(:source).value(@medicine.source)
    report.page.item(:title).value(@medicine.title)
    report.page.item(:name).value(@medicine.name)
    report.page.item(:detail).value(@medicine.detail)
    report.page.item(:report_staff).value(@medicine.report_staff)
    
    file = report.generate

    send_data(
      file,
      filename: "DICard.pdf",
      type: "application/pdf",
      disposition: "inline")
  end

  def medicine_params
    params.require(:medicine).permit(:name, :title, :reported_at, :request_staff, :detail, :source, :report_staff, :approval_flg)
  end
end
