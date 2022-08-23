class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
 add_flash_types :success, :info, :warning, :danger

 def after_sign_in_path_for(resource)
  user_path(current_user)
 end

 def after_sign_out_path_for(resource)
  root_path
 end

 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
 end

end
