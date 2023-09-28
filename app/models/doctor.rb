class Doctor < ApplicationRecord
  belongs_to :location
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
