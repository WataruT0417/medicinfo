class ReactionsController < ApplicationController
  include ReactionsHelper
  def home
    @reaction = Reaction.new
    @reactions = Reaction.paginate(page: params[:page], per_page: 10).order('id desc').where(
      "name like ?", "%%")
  end

  def new
    @reaction = Reaction.new
  end
  
  def filter
    @reaction = Reaction.new(reaction_params)
    filter = filter_param(@reaction.name, "name", filter = "")
    @reactions = Reaction.paginate(page: params[:page], per_page: 10).order('id desc')
    @reactions = @reactions.where("name like ?", "%#{@reaction.name}%") if @reaction.name.present?
    @reactions = @reactions.where("title like ?", "%#{@reaction.title}%") if @reaction.title.present?
    @reactions = @reactions.where("reported_at like ?", "%#{@reaction.reported_at}%") if @reaction.reported_at.present?
    @reactions = @reactions.where("doctor like ?", "%#{@reaction.doctor}%") if @reaction.doctor.present?
    @reactions = @reactions.where("patient_id like ?", "%#{@reaction.patient_id}%") if @reaction.patient_id.present?
    @reactions = @reactions.where("patient_name like ?", "%#{@reaction.patient_name}%") if @reaction.patient_name.present?
    @reactions = @reactions.where("detail like ?", "%#{@reaction.detail}%") if @reaction.detail.present?
    @reactions = @reactions.where("report_staff like ?", "%#{@reaction.report_staff}%") if @reaction.report_staff.present?
    render 'home'
  end

  def create
    @reaction = Reaction.new(reaction_params)
    if @reaction.save
      flash[:success] = "新規登録が完了しました。"
      redirect_to :action => 'home'
    else
      render 'new'
    end
  end

  def edit
    @reaction = Reaction.find(params[:id])
  end

  def update
    @reaction = Reaction.find(params[:id])
    if @reaction.update_attributes(reaction_params)
      flash[:success] = "修正が完了しました。"
      redirect_to :action => 'home'
    else
      render 'edit'
    end
  end

  def destroy
    Reaction.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to :action => 'home'
  end

  def reaction_params
    params.require(:reaction).permit(:name, :title, :reported_at, :doctor, :patient_id, :patient_name, :detail, :report_staff)
  end
end
