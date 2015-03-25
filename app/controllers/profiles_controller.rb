class ProfilesController < ApplicationController
  before_action :get_user
  
  def get_user
    @user = User.find params[:id]
  end
  
end
