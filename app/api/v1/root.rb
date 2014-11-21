module API
  module V1
    class Root < Grape::API
      mount API::V1::Posts
      mount API::V1::Projects
    end
  end
end