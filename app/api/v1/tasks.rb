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
          @tasks = @harvest.tasks_by_client(current_user)
        end
      end
    end
  end
end