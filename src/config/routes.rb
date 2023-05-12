Rails.application.routes.draw do
  get 'dashboard', to: 'dashboards#top'
  get 'login', to: 'user_sessions#new', as: 'login'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: 'logout'
  root to: 'home#top'
  resources :users, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
