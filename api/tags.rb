module API
  class Tags < Grape::API
    resource :tags do

      desc 'Parse new tags'

      params do
        requires :url, type: String, desc: 'Page url'
      end

      get :parse do
        # parse page from url
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
