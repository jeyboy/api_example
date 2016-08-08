require 'rails_helper'

require 'airborne'
require_relative '../app/controllers/api/root'

Airborne.configure do |config|
  config.rack_app = API::Root
end

describe API::Tags do
  let(:call_url) {'https://ok.ru/'}
  context 'GET /api/tags' do
    it 'returns 200 response' do
      get '/api/tags'
      expect_status(200)
    end

    it 'returns all tags' do
      Tag.create(body: 'soso1')
      Tag.create(body: 'soso2')

      get '/api/tags'
      expect_json(Tag.all.as_json.map(&:symbolize_keys))
    end
  end

  context 'PUT /api/tags' do
    it 'returns 200 response' do
      put '/api/tags', {url: call_url}
      expect_status(200)
    end

    it 'create new tags' do
      expect{
        put '/api/tags', {url: call_url}
      }.to change{Tag.count}
    end
  end
end
