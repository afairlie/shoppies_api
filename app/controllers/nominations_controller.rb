class NominationsController < ApplicationController
  def show
        render json: { nominations: @user.nomination }
  end
  
  def create
    nom = params[:nomination]
    Nomination.create(user_id: @user.id, '1': nom['1'], '2': nom['2'], '3': nom['3'], '4': nom['4'], '5': nom['5'])
    render json: { message: "Create nominations route coming soon ;)", token: @token, nominations: @user.nomination}
  end

end
