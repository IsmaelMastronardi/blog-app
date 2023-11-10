class AuthenticationController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:login]
  skip_before_action :authenticate_request
  include JsonWebToken

  def login
    @user = User.find_by_email(params[:email])
    puts "Params: #{params.inspect}"
    if @user&.valid_password?(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
