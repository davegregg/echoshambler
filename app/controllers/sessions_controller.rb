class SessionsController < ApplicationController

    def create
      @user = User.find_by(username: params[:username])&.
                   authenticate(params[:password])
      if @user
        render json: @user, serializer: UserTrustedSerializer
      else
        render json: ["Incorrect."], status: 401
      end
    end

end
