class UsersController < ApplicationController

  before_action :require_user, only: [:creep, :destroy]

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
    binding.pry
    user.destroy
  end

  def creep_on
    i = current_user.toggle_creep!(user) ? 1 : -1
    current_user.creepers_count += i
    user.creepees_count += i
    render json:   ["#{current_user.username} is #{'no longer ' if i < 1}creeping on #{user.username}"]
  end

  def creeps_on
    render json: [User.find_by(username: request_params[:creeper])
                      .creeps?(user)]
  end

  def creepers
    render json: user.creepers(User)
  end

  def creeping_on
    render json: user.creepees(User)
  end

  private

  def request_params
    params[:username].downcase!
    params.permit(:username,
                  :fullname,
                  :email,
                  :photo_url,
                  :password,
                  :creeper)
  end

end
