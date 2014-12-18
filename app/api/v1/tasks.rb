module API
  module V1
    class Tasks < Grape::API
      helpers API::V1::Helpers::DateHelper
      version 'v1'

      before do
        @harvest = HarvestDecorator.new(HarvestLoader.getHarvestInstance)
      end

      resource :tasks do

        desc "Return tasks for client"
        get '', :rabl => "v1/tasks" do
          @tasks = @harvest.tasks_by_client(current_user)
        end

        desc "Returns entries for a task"
        get ':task_id/entries', :rabl => "v1/entries" do
          task_id = params[:task_id]
          error!('Unauthorized', 401) unless @harvest.client_has_task?(current_user, task_id)
          @entries = @harvest.entries_by_task(current_user, start_date, end_date, task_id)
        end
      end
    end
  end
end