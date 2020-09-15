class UsersController < ApplicationController
  # read in the user params
  # create a new user with them
  # send back created user

  def create
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if user 
      render json: user
    else 
      render json: 'Failed to create user'
    end
  end
end
