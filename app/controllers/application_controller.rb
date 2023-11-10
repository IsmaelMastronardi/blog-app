class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  # before_action :authenticate_user!, unless: -> { request.path =~ /^\/api\/v1\//}
  before_action :authenticate_request
  # before_action :authenticate_user!, unless: -> { request.path =~ /^\/api\/v1\//}

  private

  def authenticate_request
    header = request.headers["Authorization"]  
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
