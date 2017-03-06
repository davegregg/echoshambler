class GruntsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    current_user ? render(json: Grunt.chamber(user)) : super
  end

  def show
    # show one grunt by path-provided id, or all of this users' grunts
    request_params[:id] ? super : render(json: user.grunts)
  end

  def create
    grunt = Grunt.new(body: request_params[:body],
                      user: user)
    grunt.save ? render(json: grunt) : render(error_up(grunt))
  end

  def destroy
    user.grunts
        .find(request_params[:id])
        .destroy
  end

  private

  def request_params
    params[:username]&.downcase!
    params.permit(:id,
                  :body,
                  :username)
  end

end
