class SocialSitesController < ApplicationController
  def create
    auth = env["omniauth.auth"]     
    @user = User.from_omniauth(auth)
    session[:fb_token] = @user.access_token
    sign_in :user,@user
    redirect_to root_path
  end
end
