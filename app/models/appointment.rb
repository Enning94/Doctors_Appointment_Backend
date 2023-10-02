class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :patient_id, presence: true, numericality: { only_integer: true }
  validates :doctor_id, presence: true, numericality: { only_integer: true }
  validates :appointment_date, presence: true
  validates :city, presence: true
  validates :appointment_duration, presence: true, numericality: { only_integer: true }
end
