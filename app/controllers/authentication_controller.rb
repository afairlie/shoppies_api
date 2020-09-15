class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if !user
      render json: { error: "invalid email"}
    end

    if user.authenticate(params[:password])
      render json: { message: "Correct password!"}
    else 
      render json: { message: "Incorrect password :("}
    end
  end
end
