module API
  module V1
    module Helpers
      module DateHelper
        def start_date
          Time.parse(params[:start_date] || "20140101")
        end

        def end_date
          params[:end_date].nil? ? Time.now : Time.parse(params[:end_date])
        end
      end
    end
  end
end