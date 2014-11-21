module API
  module V1
    class Tasks < Grape::API
      version 'v1'

      before do
        @harvest = HarvestLoader.getHarvestInstance
      end

      resource :tasks do
        desc "Return list of tasks for client"
        get '', :rabl => "v1/tasks" do
          decorated_tasks = TasksDecorator.new(@harvest.tasks)
          @tasks = decorated_tasks.by_client(current_user)
        end
      end
    end
  end
end