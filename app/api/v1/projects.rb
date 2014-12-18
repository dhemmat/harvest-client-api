module API
  module V1
    class Projects < Grape::API
      helpers API::V1::Helpers::DateHelper
      version 'v1'

      before do
        @harvest =  HarvestDecorator.new(HarvestLoader.getHarvestInstance)
      end

      resource :projects do
        
        desc "Return projects for client"
        get '', :rabl => "v1/projects" do
          @projects = @harvest.projects_by_client(current_user)
        end

        desc "Return tasks for a project"
        get ':project_id/tasks', :rabl => "v1/tasks" do
          project = @harvest.projects.find(params[:project_id])
          error!('Unauthorized', 401) unless @harvest.client_has_project?(current_user, project.id)
          @tasks = @harvest.tasks_by_projects(project)
        end

        desc "Returns entries for a project"
        get ':project_id/entries', :rabl => "v1/entries" do
          project = @harvest.projects.find(params[:project_id])
          error!('Unauthorized', 401) unless @harvest.client_has_project?(current_user, project.id)
          @entries = @harvest.entries_by_project(project, start_date, end_date)
        end

      end
    end
  end
end