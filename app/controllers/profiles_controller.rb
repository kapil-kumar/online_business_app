class ProfilesController < ApplicationController
  before_action :authenticate_user!,:except => [:show]
  before_action :get_user
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Updated details successfully!"
      redirect_to profile_path(@user)
    else
      flash[:error] = "Details updation failed!"
      render :action => :edit
    end
  end
  
  def edit_pic
  end
  
  def update_pic
    if @user.update_attributes(user_params)
      flash[:success] = "Updated profile picture successfully!"
      render :action => "crop_pic"
    else
      puts @user.errors.inspect
      flash[:error] = "Updation failed!"
      render :action => :edit_pic
    end
  end
  
  def get_user
    @user = User.find params[:id]
  end
  
  def user_params
    params.require(:user).permit!
  end
  
end
