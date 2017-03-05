class GruntsController < ApplicationController
  ### works locally, but not on Heroku. Version issues? Evaluation differences?
  # before_action do
  #   request_params.each do |par|
  #     self.class.send(:define_method,
  #                     par.to_sym,
  #                     ->{ request_params[par] })
  #   end
  # end

  before_action :require_user, except: [:index, :show]

  def show
    # show one grunt by id, or all users' grunts
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
                  :user,
                  :username)
  end

end
