require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do

before(:all) do
    Doctor.delete_all
    @doctor = Doctor.create(name: 'John Doe', profile_pic: "https://robohash.org/doctor.png?size=300x300&set=set1", 
        bio: "Quod veritatis vel. Ipsa molestiae harum. Sunt dolorem earum.",
         specialization: "Sales", consultation_fee: "31.79")
  end


  context 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns a doctor' do
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response).to be_an(Array)
      expect(json_response.length).to eq(1)
    end
  end

  context 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: @doctor.id }
      expect(response).to have_http_status(:success)
    end
  end

  context 'POST #create' do
    let(:valid_params) do
      {
        doctor: {
            name: "Ollie Torphy123",
            profile_pic: "https://robohash.org/doctor.png?size=300x300&set=set1",
            bio: "Quod veritatis vel. Ipsa molestiae harum. Sunt dolorem earum.",
            specialization: "Sales",
            consultation_fee: "31.79"
        }
      }
    end

    it 'creates a new doctor' do
      post :create, params: valid_params
      expect(response).to have_http_status(:created)
    end

    it 'returns the correct response message' do
      post :create, params: valid_params
      expect(response.body).to eq('Doctor successfully created✅')
    end
  end

  context 'DELETE #destroy' do
    it 'deletes a doctor' do
      delete :destroy, params: { id: @doctor.id }
      expect(response).to have_http_status(:success)
    end
  end
end
