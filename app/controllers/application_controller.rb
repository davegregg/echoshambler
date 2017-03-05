class ApplicationController < ActionController::API

  def index
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$#{model_class}$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    render json: model_class.all
  end

  def show(by_parameter = :id)
    key = by_parameter
    parameter = {key => request_params[by_parameter]}
    render json: model_class.find_by(parameter)
  end

  private

  def model_class
    eval(self.lookup_context
             .prefixes # controller name prefixes, by ascending inheritance
             .first # lowercase, pluralized name of the model we want
             .camelize
             .singularize)
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
                           .map!{ |error| {error: error} }
    Hash(json: {errors: errors},
         status: 400)
  end

end
