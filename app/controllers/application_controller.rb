class ApplicationController < ActionController::API

  def index
    render json: model_class.all
  end

  def show
    key = by_parameter ||= :id # default to :id if undefined
    parameter = {key => user_params[by_parameter]}
    render json: model_class.find_by(parameter)
  end

  private

  def model_class
    serialization_scope.class
  end

  def current_user
    @current_user ||= User.find_by(token: params[:token])
  end

  def require_user
    unless current_user
      render json: ["You need to be logged in to do this."],
             status: 401
    end
  end

  def error_messages(class_instance)
    errors = class_instance.errors
                           .full_messages
                           .map!{ |error| Hash(error: error) }
    Hash(json: {errors: errors}, status: 400)
  end

end
