class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :devise_parameters_whitelist, if: :devise_controller?

  protected

  def devise_parameters_whitelist
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :bio, :location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :bio, :location])
  end
end
