class NominationsController < ApplicationController
  def show
    authorization_header = request.headers[:authorization]
    if !authorization_header
      render status: :unauthorized
    else 
      token = authorization_header.split.last
      decoded_token = JWT.decode(token, Rails.application.credentials.dig(:secret_key_base)).first
      nominations = User.find(decoded_token["id"]).nomination
      render json: {'nominations': nominations}
    end
  end
  
  def create
    
  end

end
