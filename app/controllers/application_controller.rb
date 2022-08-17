class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]

 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
 end

end
