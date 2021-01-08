class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if user.save 
      payload = {
        id: user.id,
        email: user.email,
        exp: 10.minutes.from_now.to_i }
      token = JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
      render json: { token: token, username: user.name }
    else 
      render json: { error: 'Failed to create user' }, status: :unauthorized
    end
  end
end
