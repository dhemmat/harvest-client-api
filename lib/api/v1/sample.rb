module API
	module V1
		class Root < Grape::API
			version 'v1'
			format :json

			desc "sample"
			get 'sample' do
				"SAMPLE"
			end

		end
	end
end


# module API::V1
# 	class Sample < Base
#     desc "Return a sample."
#     get :sample do
#       "test"
#     end
# 	end
# end
