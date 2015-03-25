class SocialSitesController < ApplicationController
  def create
    auth = env["omniauth.auth"]     
    @user = User.from_omniauth(auth)
    sign_in :user,@user
    redirect_to root_path
  end
end
