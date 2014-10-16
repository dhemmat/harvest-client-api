module API
  module V1
    class Posts < Grape::API
      version 'v1'
      format :json

      resource :posts do
        desc "Return list of recent posts"
        get do
          "LALALAL"
        end
      end
    end
  end
end