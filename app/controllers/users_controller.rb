class UsersController < ApplicationController

  def show
    super(:username)
  end

  def create
    user = User.new(request_params)
    if user.save
      render json: user, serializer: UserTrustedSerializer
    else
      render error_messages(user)
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
    parameters = params.permit(:username,
                               :fullname,
                               :email,
                               :photo_url,
                               :password)
    return parameters
  end

end
