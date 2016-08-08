require 'grape'
require 'grape-swagger'
require_relative './tags'

module API
  class Root < Grape::API
    version 'v1', using: :header, vendor: 'hudo'
    format :json
    prefix :api

    mount API::Tags

    add_swagger_documentation
  end
end
