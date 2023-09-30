require 'rails_helper'

RSpec.describe Api::V1::AppointmentsController, type: :controller do
  before (:each) do
    Doctor.delete_all
    Patient.delete_all
    Appointment.delete_all
    @doctor = Doctor.create(name: "Ankit", profile_pic: "xyz.ynh", bio: "I am a doctor", specialization: "Neck surgeon", consultation_fee: 150)
    @patient = Patient.create(username: "ank1234", name: "Ank", email: "ank@gmail.com", password: "Abc1234")
    @appointment = Appointment.create(patient_id: @patient.id, doctor_id: @doctor.id, appointment_date: "2023-10-10", city: "Mumbai", appointment_duration: 2)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns an Appointment" do 
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response).to be_an(Array)
      expect(json_response.length).to eq(1)
    end
  end

end
