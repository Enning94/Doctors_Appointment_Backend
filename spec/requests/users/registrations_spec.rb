require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post :create, params: {
            user: {
              email: 'test@example.com',
              password: 'password',
              password_confirmation: 'password',
              name: 'Test User',
              username: 'testuser'
            }
          }, format: :json
        }.to change(User, :count).by(1)

        expect(response).to have_http_status(:success)
        
        # Check for the presence of keys and values in the JSON response
        json_response = JSON.parse(response.body)
        expect(json_response['status']['message']).to eq('Signed up successfully.')
        expect(json_response['data']['name']).to eq('Test User')
        expect(json_response['data']['username']).to eq('testuser')
      end
    end

    context 'with invalid params' do
      it 'returns an error message' do
        post :create, params: {
          user: {
            email: 'invalid_email',
            password: 'password',
            password_confirmation: 'wrong_confirmation',
            name: '',
            username: 'testuser'
          }
        }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)

        # Check for the presence of keys and values in the JSON response
        json_response = JSON.parse(response.body)
        expect(json_response['status']['message']).to match(/User couldn't be created successfully/)
      end
    end
  end
end
