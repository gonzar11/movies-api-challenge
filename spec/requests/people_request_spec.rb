require 'rails_helper'

RSpec.describe "Person", type: :request do
  let!(:people) { create_list(:person, 5) }
  let(:person_id) { people.first.id }
  let(:user) { create(:user) }  
  let(:headers) { valid_headers }

  describe 'GET /people' do
    before { get '/people' }

    it 'returns people' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /people/:id' do
    before { get "/people/#{person_id}" }

    context 'when the record exists' do
      it 'returns the person' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(person_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:person_id) { 999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Person/)
      end
    end
  end

  describe 'POST /people' do
    let(:valid_attributes) { { first_name: 'Gonzalo', last_name: 'Ricco', aliases: 'gr'  } }

    context 'when the request is valid' do
      before { post '/people', params: valid_attributes, headers: headers }

      it 'creates a person' do
        expect(json['first_name']).to eq('Gonzalo')
        expect(json['last_name']).to eq('Ricco')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/people', params: { first_name: '', last_name: '' }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: First name can't be blank/)
      end
    end
  end

  describe 'PUT /people/:id' do
    let(:valid_attributes) { { first_name: 'Quentin', last_name: 'Tarantino' } }
    before { put "/people/#{person_id}", params: valid_attributes, headers: headers }

    context 'when the record exists' do
      it 'updates the record' do
        expect(json['first_name']).to eq('Quentin')
        expect(json['last_name']).to eq('Tarantino')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      let(:person_id) { 999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Person/)
      end
    end
  end

  describe 'DELETE /people/:id' do
    before { delete "/people/#{person_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
