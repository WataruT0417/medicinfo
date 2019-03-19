class DoubtsController < ApplicationController
  include DoubtsHelper
  def home
    @doubt = Doubt.new
    @doubts = Doubt.paginate(page: params[:page], per_page: 10).order('id desc').where(
      "name like ?", "%%")
  end

  def new
    @doubt = Doubt.new
  end
  
  def filter
    @doubt = Doubt.new(doubt_params)
    filter = filter_param(@doubt.name, "name", filter = "")
    @doubts = Doubt.paginate(page: params[:page], per_page: 10).order('id desc')
    @doubts = @doubts.where("name like ?", "%#{@doubt.name}%") if @doubt.name.present?
    @doubts = @doubts.where("title like ?", "%#{@doubt.title}%") if @doubt.title.present?
    @doubts = @doubts.where("reported_at like ?", "%#{@doubt.reported_at}%") if @doubt.reported_at.present?
    @doubts = @doubts.where("doctor like ?", "%#{@doubt.doctor}%") if @doubt.doctor.present?
    @doubts = @doubts.where("detail like ?", "%#{@doubt.detail}%") if @doubt.detail.present?
    @doubts = @doubts.where("report_staff like ?", "%#{@doubt.report_staff}%") if @doubt.report_staff.present?
    render 'home'
  end

  def create
    @doubt = Doubt.new(doubt_params)
    if @doubt.save
      flash[:success] = "新規登録が完了しました。"
      redirect_to :action => 'home'
    else
      render 'new'
    end
  end

  def edit
    @doubt = Doubt.find(params[:id])
  end

  def update
    @doubt = Doubt.find(params[:id])
    if @doubt.update_attributes(doubt_params)
      flash[:success] = "修正が完了しました。"
      redirect_to :action => 'home'
    else
      render 'edit'
    end
  end

  def destroy
    Doubt.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to :action => 'home'
  end

  def doubt_params
    params.require(:doubt).permit(:name, :title, :reported_at, :doctor, :detail, :report_staff)
  end
end
