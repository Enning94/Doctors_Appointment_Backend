class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one :location
end

