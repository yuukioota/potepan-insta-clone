class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :set_user, only: %i(password_changes destroy)
  
  def password_changes
    if @user == current_user 
    else
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end
  

  def destroy
    if @user.destroy
      flash[:notice] = "アカウントを削除しました" 
      redirect_to new_user_registration_path
    else
      render edit_user_registration
    end
    
  end

  protected

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