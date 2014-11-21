module API
  module V1
    class Projects < Grape::API
      version 'v1'
      format :json

      before do
        @harvest = HarvestLoader.getHarvestInstance
      end

      resource :projects do
        desc "Return list of projects for client"
        get do
          projects = @harvest.projects.all(nil, :client => current_user.harvest_client_id)
          projects_hash = Hash.new
          projects_hash[:projects] = projects.map do |p|
            p.slice("name","id").to_h
          end
          (projects_hash).to_json
        end
      end
    end
  end
end