Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    resources :users
    resources :plans
    get 'token', to: 'token#get'
  end
end
