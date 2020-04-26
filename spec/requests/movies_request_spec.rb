require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let!(:movies) { create_list(:movie, 5) }
  let(:movie_id) { movies.first.id }
  let(:user) { create(:user) }
  let(:headers) { valid_headers }

  describe 'GET /movies' do
    before { get '/movies' }

    it 'returns movies' do
      puts headers
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /movies/:id' do
    before { get "/movies/#{movie_id}" }

    context 'when the record exists' do
      it 'returns the movie' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(movie_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:movie_id) { 999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Movie/)
      end
    end
  end

  describe 'POST /movies' do
    let(:valid_attributes) { { title: 'Pulp Fiction', release_year: '1995' } }

    context 'when the request is valid' do
      before { post '/movies', params: valid_attributes, headers: headers }

      it 'creates a movie' do
        expect(json['title']).to eq('Pulp Fiction')
        expect(json['release_year']).to eq(1995)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/movies', params: { title: '' }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /movies/:id' do
    let(:valid_attributes) { { title: 'Inception', release_year: 2010 } }
    before { put "/movies/#{movie_id}", params: valid_attributes, headers: headers }

    context 'when the record exists' do
      it 'updates the record' do
        expect(json['title']).to eq('Inception')
        expect(json['release_year']).to eq(2010)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      let(:movie_id) { 999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Movie/)
      end
    end
  end

  describe 'DELETE /todos/:id' do
    before { delete "/movies/#{movie_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
