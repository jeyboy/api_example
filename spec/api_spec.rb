require 'airborne'
require_relative '../api/root'
require 'pry'

Airborne.configure do |config|
  config.rack_app = API::Root
end

describe API::Tags do
  context 'GET /api/tags' do
    it 'returns 200 response' do
      get "/api/tags"
      expect_status(200)
    end

    it 'returns all tags' do
      get "/api/tags"
      expect_json([])
    end
  end
end
