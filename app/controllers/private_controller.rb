class PrivateController < ActionController::API
  Secured

  def private
    render json: { message: 'Hello from a private endpoint! You need to be authenticated to see this.'}
  end
end
