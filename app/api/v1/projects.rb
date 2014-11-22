module API
  module V1
    class Projects < Grape::API
      version 'v1'

      before do
        @harvest =  HarvestDecorator.new(HarvestLoader.getHarvestInstance)
      end

      resource :projects do
        
        desc "Return projects for client"
        get '', :rabl => "v1/projects" do
          @projects = @harvest.projects_by_client(current_user)
        end

        desc "Return tasks for a particular project"
        get ':project_id/tasks' do
          #TODO: Only allow projects available for current user.
          project = @harvest.projects.find(params[:project_id])
          @tasks = @harvest.tasks_by_projects(project)
        end

      end
    end
  end
end