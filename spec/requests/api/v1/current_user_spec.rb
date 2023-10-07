require 'rails_helper'

RSpec.describe Api::V1::CurrentUserController, type: :controller do
  before(:each) do
    User.delete_all
    @user = User.create(username: 'ank1234', name: 'Ank', email: 'ank@gmail.com', password: 'Abc1234')
  end

  before do
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
