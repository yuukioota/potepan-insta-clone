class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
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

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
    
    def after_update_path_for(resource)
      user_path(resource)
    end
end