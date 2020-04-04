class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id])
  end
end
