class ApplicationController < ActionController::API
    before_action :require_login

    private

    def require_login
        auth_header = request.headers[:authorization]
        if !auth_header
          render status: :unauthorized, json: {error: 'Unauthorized'}
        else 
          @token = auth_header.split.last
          begin
            decoded_token = JWT.decode(@token, Rails.application.credentials.dig(:secret_key_base), true, algorithm: 'HS256').first
            @user = User.find(decoded_token["id"])
          rescue JWT::ExpiredSignature
            render status: :unauthorized, json: { error: 'Expired Token' }
          rescue JWT::DecodeError
            render status: :unauthorized, json: { error: 'Decode Error / Unauthorized'}
          end
        end
    end

end
