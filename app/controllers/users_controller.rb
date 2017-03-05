class UsersController < ApplicationController

  def show
    super(:username)
  end

  def create
    new_user = User.new(request_params)
    if new_user.save
      render json: new_user, serializer: UserTrustedSerializer
    else
      render error_up(new_user)
    end
  end

  def destroy
  end

  # def follow
  #   @current_user.toggle_follow!(
  #                   User.find(params[:username])
  #                 )
  # end

  private

  def request_params
    params[:username].downcase!
    params.permit(:username,
                  :fullname,
                  :email,
                  :photo_url,
                  :password)
  end

end
