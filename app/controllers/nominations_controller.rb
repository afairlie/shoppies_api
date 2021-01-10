class NominationsController < ApplicationController
  def show
        render json: { nominations: @user.nomination }
  end
  
  def create
    noms = params[:nomination].permit(['1'], ['2'], ['3'], ['4'], ['5']).to_h

    if noms.length() == 5
      if @user.nomination
        @user.nomination.update(noms)
      else
        noms[:user_id] = @user.id
        new_noms = Nomination.create(noms)
      end
      return render json: { token: @token, nominations: new_noms || noms }
    end

    render json: { token: @token, message: "failed to create/update nominations"}
  end
end