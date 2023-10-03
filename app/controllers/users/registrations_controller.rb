# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # skip_before_action :verify_authenticity_token, only: [:signin, :signup, :signout]
  include RackSessionsFix

  respond_to :json
  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
  
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username)
  end
end
