class GruntsController < ApplicationController

  before_action do
    request_params.each do |par|
      self.class.send(:define_method,
                      par.to_sym,
                      ->{ request_params[par] })
    end
  end

  def show
    if id
      super
    else
      render json: user.grunts
    end
  end

  def create
    grunt = Grunt.new(body: body,
                      user: user)
    if grunt.save
      render json: grunt
    else
      render error_messages(grunt)
    end
  end

  def destroy
    user.grunts
        .find(id)
        .destroy
  end

  private

  def request_params
    params[:username].downcase!
    params.permit(:id,
                  :body,
                  :user,
                  :username)
  end

  def user
    User.find_by(username: username)
  end

end
