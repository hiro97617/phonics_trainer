Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    root to: 'home#top'
    get 'outline', to: 'outlines#static_page'
    get 'explanation', to: 'explanations#static_page'
    get "/pages/*id" => 'pages#show', as: :static_page, format: false
    get 'dashboard', to: 'dashboards#top'
    get 'login', to: 'user_sessions#new', as: 'login'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy', as: 'logout'
    resources :password_resets, only: %i[new create edit update]
    resource :profile, only: %i[show edit update]
    get 'multiple_choice_questions', to: 'multiple_choice_questions#top'
    get 'lessons', to: 'lessons#top'
    resources :users, only: %i[new create]
    resources :level_parts, only: %i[show] do
      resources :multiple_choice_questions, only: %i[new create index show update], name_prefix: 'multiple_choice_'
      resources :lessons, only: %i[index]
      get 'multiple_choice/result', to: 'multiple_choice_questions#result_page'
    end
    resources :lessons, only: %i[show]
    resources :multiple_choice_questions, only: %i[] do
      get 'answer', to: 'multiple_choice_questions#answer'
    end
    resources :multiple_choices, only: %i[] do
      resources :multiple_choice_judgements, only: %i[create]
    end

    namespace :admin do
      root to: 'dashboards#index'
      resources :users, only: %i[index edit update destroy]
      resources :level_parts, only: %i[show index new create edit update destroy] do
        resources :multiple_choice_questions, only: %i[index new create]
        resources :lessons, only: %i[index new create]
      end
      get 'multiple_choice_questions/top', to: 'multiple_choice_questions#top', as: 'multiple_choice_top'
      get 'lessons', to: 'lessons#top'
      resources :multiple_choice_questions, only: %i[show edit update destroy]
      resources :lessons, only: %i[show edit update destroy] do
        resources :embeds, only: %i[create], shallow: true
      end
      resources :embeds, only: %i[edit update destroy]
      resources :tags, only: %i[index new create edit update destroy]
      resources :dashboards, only: %i[index]
      get 'login', to: 'user_sessions#new', as: 'login'
      post 'login', to: 'user_sessions#create'
      delete 'logout', to: 'user_sessions#destroy', as: 'logout'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
