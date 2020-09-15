class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if !user
      render json: { error: "Invalid email"},
      status: :unauthorized
    elsif user.authenticate(params[:password])
      token = JWT.encode({id: user.id, email: user.email}, Rails.application.credentials.dig(:secret_key_base))
      render json: { token: token }
    else 
      render json: { message: "Incorrect password :("},
      status: :unauthorized
    end
  end
end
