class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      doctors_path
    else
      patients_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end