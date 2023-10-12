class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  # Create a new session (login)
  def create
    self.resource = find_resource

    if resource&.valid_password?(sign_in_params[:password])
      sign_in(resource_name, resource)
      yield resource if block_given?
      # token = issue_token(resource)
      render json: {
        status: {
          code: 200,
          message: 'Logged in successfully.',
          # jwt: token,
          data: { user: UserSerializer.new(resource).serializable_hash[:data][:attributes] }
        }
      }, status: :ok

      create_admin(sign_in_params[:admin_key])

    else
      render json: {
        status: 401,
        message: 'Invalid email/username or password.'
      }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
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
    params.require(:user).permit(:password, :login, :admin_key)
  end

  def find_resource
    login = sign_in_params[:login]
    return unless login.present?

    User.find_by(email: login) || User.find_by(username: login)
  end

  def create_admin(admin_key)
      # Assuming current_user is already defined
      if admin_key == ENV['ADMIN_SECRET_KEY']
        current_user.update(admin: true)
      else
        current_user.update(admin: false)
      end
  end
end
