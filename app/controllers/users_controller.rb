class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id])
  end
  
  def edit
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  
  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
