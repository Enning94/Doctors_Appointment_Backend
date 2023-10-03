class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix

  respond_to :json

  # Create a new session (login)
  def create
    self.resource = find_resource

    if resource&.valid_password?(sign_in_params[:password])
      sign_in(resource_name, resource)
      yield resource if block_given?

      render json: {
        status: {
          code: 200,
          message: 'Logged in successfully.',
          data: { user: UserSerializer.new(resource).serializable_hash[:data][:attributes] }
        }
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'Invalid email/username or password.'
      }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split.last,
                               ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)).first
      current_user = User.find(jwt_payload['sub'])
    end

    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  private

  # Override find_for_database_authentication to allow login with both email and username
  def find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login)).present?
      where(conditions.to_h).where(['lower(email) = :value OR lower(username) = :value',
                                    { value: login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  # Permit both :email and :password parameters for login
  def sign_in_params
    params.require(:user).permit(:password, :login)
  end

  def find_resource
    login = sign_in_params[:login]
    return unless login.present?

    User.find_by(email: login) || User.find_by(username: login)
  end
end
