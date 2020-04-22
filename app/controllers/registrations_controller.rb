class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
  def password_changes
    @user = User.find_by(id: params[:id])
    if @user == current_user 
    else
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end
  

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:notice] = "アカウントを削除しました" 
      redirect_to new_user_registration_path
    else
      render edit_user_registration
    end
    
  end

  protected

    # def update_password_resource(resource, params)
    #   resource.update_with_password(params)
    # end
    
    def update_resource(resource, params)
      if not params[:password]
        resource.update_without_current_password(params)
      else
        if resource.update_with_password(params)
          sign_in(current_user, bypass: true)
        end
      end
    end
    
    def after_update_path_for(resource)
      user_path(resource)
    end
end