class StaffsController < ApplicationController
  def home
    @staffs = Staff.paginate(page: params[:page], per_page: 10).order('id')
  end
  
  def new
    @staff = Staff.new
  end
  
  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      flash[:success] = "新規登録が完了しました。"
      redirect_to :action => 'home'
    else
      render 'new'
    end
  end

  def edit
    @staff = Staff.find(params[:id])
  end
  
  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(staff_params)
      flash[:success] = "修正が完了しました。"
      redirect_to :action => 'home'
    else
      render 'edit'
    end
  end

  def destroy
    Staff.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to :action => 'home'
  end

  def staff_params
    params.require(:staff).permit(:name)
  end
end
