class ApiV1 < Grape::API
  Dir["#{Rails.root}/app/api/v1/*.rb"].each do |f|
    mount "API::V1::#{File.basename(f, '.*').camelize}".constantize
  end
end
