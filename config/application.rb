

require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module HarvestClientApi
  class Application < Rails::Application
    config.paths.add "app/api", glob: "**/*.rb"
    config.autoload_paths += Dir["#{Rails.root}/app"]    
  end
end

git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch confing/harvest_config.yml' \
--prune-empty --tag-name-filter cat -- --all