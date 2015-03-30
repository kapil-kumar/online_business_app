class SessionsController < Devise::SessionsController
  
  def destroy    
    if session[:fb_token]
      token = current_user.access_token
      session[:fb_token] = nil
      redirect = "https://www.facebook.com/logout.php?next=#{root_url}&access_token=#{token}"
    else
      redirect = root_path
    end
    sign_out(:user)
    redirect_to  redirect
  end
end
