class GruntsController < ApplicationController
  ### works locally, but not on Heroku. Version issues?
  # before_action do
  #   request_params.each do |par|
  #     self.class.send(:define_method,
  #                     par.to_sym,
  #                     ->{ request_params[par] })
  #   end
  # end

  def show
    if request_params[:id]
      super
    else
      render json: user.grunts
    end
  end

  def create
    grunt = Grunt.new(body: request_params[:body],
                      user: user)
    if grunt.save
      render json: grunt
    else
      render error_messages(grunt)
    end
  end

  def destroy
    user.grunts
        .find(request_params[:id])
        .destroy
  end

  private

  def request_params
    params[:username]&.downcase! #if params[:username].nil? == false
    params.permit(:id,
                  :body,
                  :user,
                  :username)
  end

  def user
    User.find_by(username: request_params[:username])
  end

end
