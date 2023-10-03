class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def jwt_key
    ENV['DEVISE_JWT_SECRET_KEY']
end

def issue_token(user)
    JWT.encode({user_id: user.id}, jwt_key, "HS256")
end


def decoded_token
  begin
      JWT.decode(token, jwt_key, true, { :algorithm => 'HS256' })
  rescue => exception
      [{error: "Invalid Token"}]
  end    
end

def token
  request.headers["Authorization"]
end

def user_id
  decoded_token.first["user_id"]
end

def current_user
  user ||= User.find_by(id: user_id)
end

def logged_in?
  !!current_user
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
  end
end
