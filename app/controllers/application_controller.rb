class ApplicationController < ActionController::Base

  before_action :configure_permitedd_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top]

  protected

  def configure_permitedd_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
