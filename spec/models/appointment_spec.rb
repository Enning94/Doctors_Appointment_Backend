require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:user) { User.create(name: 'John Doe', username: 'johndoe', email: 'johndoe@example.com', password: 'password123') }
  let(:doctor) { Doctor.create(name: 'Dr. Smith', profile_pic: 'https://example.com/doctor.png', bio: 'Experienced doctor', specialization: 'Cardiology', consultation_fee: 50.0) }
  let(:appointment) do
    Appointment.new(
      user: user,
      doctor: doctor,
      appointment_date: DateTime.now,
      city: 'New York',
      appointment_duration: 60
    )
  end

  before { appointment.save }

  it 'is valid with valid attributes' do
    expect(appointment).to be_valid
  end

  it 'is not valid without a user' do
    appointment.user = nil
    expect(appointment).to_not be_valid
  end

  it 'is not valid without a doctor' do
    appointment.doctor = nil
    expect(appointment).to_not be_valid
  end

  it 'is not valid without an appointment date' do
    appointment.appointment_date = nil
    expect(appointment).to_not be_valid
  end

  it 'is not valid without a city' do
    appointment.city = nil
    expect(appointment).to_not be_valid
  end

  it 'is not valid without an appointment duration' do
    appointment.appointment_duration = nil
    expect(appointment).to_not be_valid
  end

  it 'is not valid with a non-integer user_id' do
    appointment.user_id = 'non_integer'
    expect(appointment).to_not be_valid
  end

  it 'is not valid with a non-integer doctor_id' do
    appointment.doctor_id = 'non_integer'
    expect(appointment).to_not be_valid
  end

  it 'is not valid with a non-integer appointment_duration' do
    appointment.appointment_duration = 'non_integer'
    expect(appointment).to_not be_valid
  end
end
