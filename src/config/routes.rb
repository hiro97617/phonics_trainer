Rails.application.routes.draw do
  get 'dashboards/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "top#index"

  namespace :admin do
    root to: 'dashboards#index'
    resources :level_parts
  end
end
