class Api::V1::CurrentUserController < ApplicationController
  include RackSessionsFix
  before_action :authenticate_user

  def index
    if current_user.present?
      render json: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok }
    else
      render json: { error: 'User not authenticated' }, status: :unauthorized
    end
  end
end
