module API
	module V1
		class Base < Grape::API
		  # def self.inherited(subclass)
		  #   super
		  #   subclass.instance_eval do
		  #     format :json
		  #   end
		  # end
		  mount API::V1::Sample
		end
	end
end

