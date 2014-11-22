module API
  module V1
    class Tasks < Grape::API
      version 'v1'

      before do
        @harvest = HarvestDecorator.new(HarvestLoader.getHarvestInstance)
      end

      resource :tasks do

        desc "Return tasks for client"
        get '', :rabl => "v1/tasks" do
          if params[:project_id].present?
            #TODO: Only allow projects available for current user.
            project = @harvest.projects.find(params[:project_id])
            @tasks = @harvest.tasks_by_projects(project)
          else
            @tasks = @harvest.tasks_by_client(current_user)
          end
        end

      end
    end
  end
end