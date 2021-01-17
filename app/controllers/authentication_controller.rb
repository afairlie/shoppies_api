class AuthenticationController < ApplicationController
  skip_before_action :require_login, only: [:login]
  def login
    user = User.find_by(email: params[:email])

    if !user
      render json: { error: "Invalid email"},
      status: :unauthorized
    else
      if user.authenticate(params[:password])
        payload = {
          id: user.id,
          username: user.name,
          email: user.email,
          exp: 5.minutes.from_now.to_i }
        token = JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
        render json: { token: token, username: user.name, nominations: user.nomination }
      else 
        render json: { error: "Incorrect password"},
        status: :unauthorized
      end
    end
  end
end
