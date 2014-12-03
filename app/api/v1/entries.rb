module API
  module V1
    class Entries < Grape::API
      version 'v1'

      before do
        @harvest =  HarvestDecorator.new(HarvestLoader.getHarvestInstance)
        @start_date = Time.parse(params[:start_date] || "20140101")
        @end_date = params[:end_date].nil? ? Time.now : Time.parse(params[:end_date])
      end

      resource :entries do
        
        desc "entries for client"
        get '', :rabl => "v1/entries" do
          @entries = @harvest.entries_by_client(current_user, @start_date, @end_date)
        end

        # desc "Return tasks for a particular project"
        # get ':project_id/tasks' do
        #   project = @harvest.projects.find(params[:project_id])
        #   error!('Unauthorized', 401) unless @harvest.client_has_project?(current_user, project.id)
        #   @tasks = @harvest.tasks_by_projects(project)
        # end

      end
    end
  end
end