class GruntsController < ApplicationController
  ### works locally, but not on Heroku. Version issues? Evaluation differences?
  # before_action do
  #   request_params.each do |par|
  #     self.class.send(:define_method,
  #                     par.to_sym,
  #                     ->{ request_params[par] })
  #   end
  # end

  def show
    request_params[:id] ? super : render(json: user.grunts)
  end

  def create
    return require_user unless current_user
    grunt = Grunt.new(body: request_params[:body],
                      user: user)
    grunt.save ? render(json: grunt) : render(error_up(grunt))
  end

  def destroy
    return require_user unless current_user
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
