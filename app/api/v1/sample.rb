module V1
	class Sample < V1::Base
    desc "Return a sample."
    get :sample do
      "test"
    end
	end
end
