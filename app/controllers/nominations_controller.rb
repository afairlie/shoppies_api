class NominationsController < ApplicationController
  def show
        render json: { nominations: @user.nomination }
  end
  
  def create
    noms = params[:nomination].to_unsafe_h
    if noms.length() == 5
      if @user.nomination
        @user.nomination.update(noms)
      else
        noms[:user_id] = @user.id
        new_noms = Nomination.new(noms)
        new_noms.save()
      end
    end
    # TO DO: send back new nominations from create
    render json: { token: @token, nominations: @user.nomination }
  end
end
