class UsersController < ApplicationController
  def create
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if user 
      render json: user
    else 
      render json: { message: 'Failed to create user' }
    end
  end
end
