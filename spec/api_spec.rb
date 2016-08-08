require 'rails_helper'

require 'airborne'
require_relative '../app/controllers/api/root'

Airborne.configure do |config|
  config.rack_app = API::Root
end

describe API::Tags do
  context 'GET /api/tags' do
    it 'returns 200 response' do
      get '/api/tags'
      expect_status(200)
    end

    it 'returns all tags' do
      Tag.create(body: 'soso1')
      Tag.create(body: 'soso2')

      get '/api/tags'
      expect_json(Tag.all.as_json)
    end
  end

  context 'PUT /api/tags' do
    it 'returns 200 response' do
      put '/api/tags', {url: 'https://ok.ru/'}
      expect_status(200)
    end

    it 'create new tags' do
      expect{
        put '/api/tags', {url: 'https://ok.ru/'}
      }.to change{Tag.count}
    end
  end
end
