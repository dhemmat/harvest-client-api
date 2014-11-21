HarvestClientApi::Application.routes.draw do
  devise_for :users
  mount API::Root => '/'
end
