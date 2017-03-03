class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find_by(username: user_params[:username])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, serializer: UserTrustedSerializer
    else
      errors = user.errors.full_messages
      errors.map!{ |error| Hash(error: error) }
      render json: Hash(errors: errors), status: 400
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
