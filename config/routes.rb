Rails.application.routes.draw do


  scope "(:locale)", locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    get 'outline', to: 'outlines#static_page'
    get 'explanation', to: 'explanations#static_page'
    get 'dashboard', to: 'dashboards#top'
    get 'login', to: 'user_sessions#new', as: 'login'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy', as: 'logout'
    root to: 'home#top'
    resource :profile, only: %i[show edit update]
    get 'multiple_choice_questions', to: 'multiple_choice_questions#top'
    resources :users, only: %i[new create]
    resources :level_parts, only: %i[show] do
      resources :multiple_choice_questions, only: %i[index show], name_prefix: "multiple_choice_"
      get 'multiple_choice/start', to: 'multiple_choice_questions#start_page'
      get 'multiple_choice/result', to: 'multiple_choice_questions#result_page'
      post 'multiple_choice/start', to: 'multiple_choice_questions#start'
      post 'multiple_choice/finish', to: 'multiple_choice_questions#finish'
    end
    resources :multiple_choice_questions, only: %i[] do
      resources :correct_questions, only: %i[create], name_prefix: "multiple_choice_correct_"
      resources :incorrect_questions, only: %i[create], name_prefix: "multiple_choice_incorrect_"
      get 'answer', to: 'multiple_choice_questions#answer'
    end
    namespace :admin do
      root to: 'dashboards#index'
      resources :users, only: %i[index edit update destroy]
      resources :level_parts, only: %i[index new create edit update destroy]
      resources :level_parts, only: %i[show] do
        resources :multiple_choice_questions, only: %i[index new create]
      end
      get 'multiple_choice_questions/top', to: 'multiple_choice_questions#top', as: 'multiple_choice_top'
      resources :multiple_choice_questions, only: %i[show edit update destroy]
      resources :tags, only: %i[index new create edit update destroy]
      resources :dashboards, only: %i[index]
      get 'login', to: 'user_sessions#new', as: 'login'
      post 'login', to: 'user_sessions#create'
      delete 'logout', to: 'user_sessions#destroy', as: 'logout'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end