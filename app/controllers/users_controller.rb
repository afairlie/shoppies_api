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
    render json: user
  end
end
