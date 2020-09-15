class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if !user
      render json: { error: "invalid email"},
      status: :unauthorized
    elsif user.authenticate(params[:password])
      render json: { message: "Correct password!"}
    else 
      render json: { message: "Incorrect password :("},
      status: :unauthorized
    end
  end
end
