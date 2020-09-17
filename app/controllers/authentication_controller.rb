class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if !user
      render json: { error: "Invalid email"},
      status: :unauthorized
    else
      if user.authenticate(params[:password])
        payload = {
          id: user.id,
          email: user.email,
          exp: 5.minutes.from_now.to_i }
        token = JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
        # is it ok to expose username, or do I need to keep in token payload and decode?
        render json: { token: token, username: user.name, nominations: user.nomination }
      else 
        render json: { error: "Incorrect password"},
        status: :unauthorized
      end
    end
  end
end
