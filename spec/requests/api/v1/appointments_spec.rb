require 'rails_helper'

RSpec.describe Api::V1::AppointmentsController, type: :controller do
  before(:each) do
    Doctor.delete_all
    User.delete_all
    Appointment.delete_all
    @doctor = Doctor.create(name: 'Ankit', profile_pic: 'xyz.ynh', bio: 'I am a doctor',
                            specialization: 'Neck surgeon', consultation_fee: 150)
    @user = User.create(username: 'ank1234', name: 'Ank', email: 'ank@gmail.com', password: 'Abc1234')
    @appointment = Appointment.create(user_id: @user.id, doctor_id: @doctor.id, appointment_date: '2023-10-10',
                                      city: 'Mumbai', appointment_duration: 2)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns an Appointment' do
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response).to be_an(Array)
      expect(json_response.length).to eq(1)
    end
  end

  describe 'POST #create' do
    let(:valid_params) do
      {
        appointment: {
          user_id: @user.id,
          doctor_id: @doctor.id,
          appointment_date: '2023-10-15',
          city: 'New York',
          appointment_duration: 1
        }
      }
    end

    it 'creates a new appointment' do
      post :create, params: valid_params
      expect(response).to have_http_status(:created)
    end

    it 'returns the correct response message' do
      post :create, params: valid_params
      expect(response.body).to eq('Appointment created successfully ✅')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes an appointment' do
      delete :destroy, params: { id: @appointment.id }
      expect(response).to have_http_status(:success)
    end
  end
end
