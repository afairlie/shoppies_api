class NominationsController < ApplicationController
  def show
    auth_header = request.headers[:authorization]
    if !auth_header
      render status: :unauthorized
    else 
      token = auth_header.split.last
      begin
        decoded_token = JWT.decode(token, Rails.application.credentials.dig(:secret_key_base)).first
        nominations = User.find(decoded_token["id"]).nomination
        render json: { nominations: nominations }
      rescue JWT::ExpiredSignature
        render status: :unauthorized, json: { error: 'Expired Token' }
      rescue JWT::DecodeError
        render status: :unauthorized, json: { error: 'Decode Error'}
      end
    end
  end
  
  def create
    render json: { message: "Create nominations route coming soon ;)"}
  end

end
