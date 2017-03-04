class UsersController < ApplicationController

  def show
    by_parameter = :username
    super
  end

  def create
    user = User.new(user_params)
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

  def user_params
    params.permit(:username,:fullname,:email,:photo_url,:password)
  end

end
