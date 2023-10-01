class Patient < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  def jwt_payload
    super.merge('foo' => 'bar')
  end
  
end
