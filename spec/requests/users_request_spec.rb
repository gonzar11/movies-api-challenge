require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { build(:user) }
  let(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }
  
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/api/signup', params: valid_attributes }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/api/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end

end
