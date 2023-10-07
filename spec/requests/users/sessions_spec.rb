require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before(:each) do
    User.delete_all
  end

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'with valid login credentials' do
      it 'logs in successfully' do
        User.create(name: 'test', username: 'testuser', email: 'test@example.com', password: 'password')

        post :create, params: {
          user: {
            login: 'test@example.com',
            password: 'password'
          }
        }, format: :json

        expect(response).to have_http_status(:ok)

        # Manually parse JSON response
        json_response = JSON.parse(response.body)
        expect(json_response['status']['message']).to eq('Logged in successfully.')
        expect(json_response['status']['code']).to eq(200)
        expect(json_response['status']['data']['user']['email']).to eq('test@example.com')
        # Add more expectations as needed for the JSON response
      end
    end

    context 'with invalid login credentials' do
      it 'returns an unauthorized error' do
        post :create, params: {
          user: {
            login: 'invalid@example.com',
            password: 'wrong_password'
          }
        }, format: :json

        expect(response).to have_http_status(:unauthorized)

        # Manually parse JSON response
        json_response = JSON.parse(response.body)

        expect(json_response['message']).to eq('Invalid email/username or password.')
        expect(json_response['status']).to eq(401)
      end
    end
  end
end
