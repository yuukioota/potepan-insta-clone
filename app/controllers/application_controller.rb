class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,        keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_up,        keys: [:user_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
      devise_parameter_sanitizer.permit(:sign_up,        keys: [:profile_text])
      devise_parameter_sanitizer.permit(:account_update, keys: [:profile_text])
      devise_parameter_sanitizer.permit(:sign_up,        keys: [:website_url])
      devise_parameter_sanitizer.permit(:account_update, keys: [:website_url])
      devise_parameter_sanitizer.permit(:account_update, keys: [:password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:tell])
      devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
    end
    
    def set_current_user
      @user = User.find(current_user.id)
    end
    
    def set_user
      @user  = User.find(params[:id])
    end
    
    
end
