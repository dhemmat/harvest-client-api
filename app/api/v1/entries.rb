module API
  module V1
    class Entries < Grape::API
      helpers API::V1::Helpers::DateHelper
      version 'v1'

      before do
        @harvest =  HarvestDecorator.new(HarvestLoader.getHarvestInstance)
      end

      resource :entries do
        desc "entries for client"
        get '', :rabl => "v1/entries" do
          @entries = @harvest.entries_by_client(current_user, start_date, end_date)
        end
      end
    end
  end
end