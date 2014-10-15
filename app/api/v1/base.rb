module V1
  class Base < Grape::API
    def self.inherited(subclass)
      super
      subclass.instance_eval do
        format :json

        # helpers Services::Representation
        # helpers Services::Paginate
        # helpers Services::GrapeParams
        # helpers Services::CallScope
        # helpers Services::Facets

        # rescue_from ActiveRecord::RecordNotFound do |e|
        #   error_response(message: e.message, status: 404)
        # end

      end
    end
  end
end
