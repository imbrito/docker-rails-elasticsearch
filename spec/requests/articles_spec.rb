require 'spec_helper'

RSpec.describe "Articles", type: :request do
  # initialize test data
  let!(:articles) { create_list(:article, 2) }
  let(:article_id) { articles.first.id }

  # Test suite for GET /articles
  describe 'GET /articles' do
    # make HTTP get request before each example
    before { get '/articles' }

    it 'returns articles' do
      # Note 'json' is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /articles/:id
  describe 'GET /articles/:id' do
    before { get "/articles/#{article_id}" }

    context 'when the record exists' do
      it 'returns the article' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(article_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:article_id) { 1001 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Article/)
      end
    end
  end

  # Test suite for POST /articles
  describe 'POST /articles' do
    # valid payload
    let(:valid_attributes) { { article: { title: 'The Black List', content: 'Elizabeth Kenn...' } } }
    let(:invalid_attributes) { { article: { title: nil, content: nil } } }

    context 'when the request is valid' do
      before { post '/articles', params: valid_attributes }
      # before { post "/articles/#{valid_attributes}" }

      it 'creates a article' do
        expect(json['title']).to eq('The Black List')
        expect(json['content']).to eq('Elizabeth Kenn...')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/articles', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Title can't be blank, Content can't be blank/)
      end
    end
  end

  # Test suite for PUT /articles/:id
  describe 'PUT /articles/:id' do
    let(:valid_attributes) { { article: { title: 'Revenge' } } }

    context 'when the record exists' do
      before { put "/articles/#{article_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /articles/:id
  describe 'DELETE /articles/:id' do
    before { delete "/articles/#{article_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end



end
