class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Posted successfully!"
      redirect_to root_path
    else
      flash[:error] = "Posting failed!"
      render :action => :new
    end
  end
  
  def post_params
    params.require(:post).permit!
  end
end
