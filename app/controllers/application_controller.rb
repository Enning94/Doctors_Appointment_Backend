class ApplicationController < ActionController::API
  # before_action :authenticate_user

  private

  def jwt_key
    ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
  end

  def issue_token(user)
    JWT.encode({ user_id: user.id }, jwt_key, 'HS256')
  end

  def decoded_token
    token = request.headers['Authorization']
    return nil unless token

    begin
      JWT.decode(token, jwt_key, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    @current_user ||= User.find_by(id: user_id)
  end

  def user_id
    decoded_token&.first&.fetch('user_id', nil)
  end

  def authenticate_user
    return if current_user

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
