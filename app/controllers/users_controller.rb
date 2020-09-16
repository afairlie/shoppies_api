class UsersController < ApplicationController
  def create
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if user 
      payload = {
        id: user.id,
        email: user.email,
        exp: 5.minutes.from_now.to_i }
      token = JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
      render json: { token: token, username: user.name }
    else 
      render json: { message: 'Failed to create user' }
    end
  end
end
