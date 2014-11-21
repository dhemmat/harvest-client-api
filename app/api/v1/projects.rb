module API
  module V1
    class Projects < Grape::API
      version 'v1'

      before do
        @harvest = HarvestLoader.getHarvestInstance
      end

      resource :projects do
        desc "Return list of projects for client"
        get '', :rabl => "projects" do
          @projects = @harvest.projects.all(nil, :client => current_user.harvest_client_id)
        end
      end
    end
  end
end