class ApplicationController < ActionController::Base
  include JsonWebToken
  protect_from_forgery with: :exception
  # skip_before_action :verify_authenticity_token
  before_action :update_allowed_parameters, if: :devise_controller?

  before_action :authenticate_request

  private

  def authenticate_request
    if request.path =~ %r{^/api/v1/}
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    else
      authenticate_user!
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
