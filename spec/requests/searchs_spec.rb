require 'spec_helper'

RSpec.describe "Searchs", type: :request do
  # initialize test data
  let!(:articles) { create_list(:article, 2) }
  let(:search) { articles.first.title }

  # Test suite for GET /articles
  describe 'GET /searchs' do
    # make HTTP get request before each example
    before { get "/searchs?keyword=#{search}" }

    it 'returns searchs' do
      # Note 'json' is a custom helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end
