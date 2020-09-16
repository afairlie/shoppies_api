class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if !user
      render json: { error: "Invalid email"},
      status: :unauthorized
    elsif user.authenticate(params[:password])
      payload = {
        id: user.id,
        email: user.email,
        exp: 5.minutes.from_now.to_i }
      token = JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
      # is it ok to send username in open, or do I need to keep in token payload and decode?
      render json: { token: token, username: user.name }
    else 
      render json: { message: "Incorrect password :("},
      status: :unauthorized
    end
  end
end
