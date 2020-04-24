class UsersController < ApplicationController
  before_action :set_current_user, only: %i(index)
  before_action :set_user, only: %i(show following followers)
  before_action :set_following, only: %i(index following followers)

  def index
    @users << @user
    @posts = Post.where(user_id: params[:id])
  end
  
  def show
    @posts = Post.includes(:photos, :user).where(user_id: params[:id]).order('created_at DESC').search(params[:search]).page(params[:page])
  end
  
  def edit
  end

  def following
    render 'show_follow'
  end
  
  def followers
    @users = @user.followers
    render 'show_follower'
  end
  
  private
    def set_following
      @users = @user.following
    end
  
end
