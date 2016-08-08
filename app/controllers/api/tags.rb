require 'rest-client'

module API
  class Tags < Grape::API
    resource :tags do

      desc 'Parse new tags'

      params do
        requires :url, type: String, desc: 'Page url'
      end

      get :parse do
        html_text = RestClient.get(params['url'])

        doc = ::Nokogiri::HTML.parse(html_text)

        ActiveRecord::Base.transaction do
          doc.css('h1,h2,h3,a').map do |tag|
            body = case tag.name
              when 'a' then tag['href']
              else tag.text
            end

            Tag.create!(body: body)
          end
        end
      end

      # desc 'Return a tag'
      #
      # params do
      #   requires :id, type: Integer, desc: 'Tag id'
      # end
      #
      # route_param :id do
      #   get do
      #     Tag.find(params[:id])
      #   end
      # end

      desc 'Return all tags'
      get do
        Tag.all
      end
    end
  end
end
