Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'home#top'

  resources :users, only: %i[new create]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :terms_of_services, only: %i[index]
  resources :privacies, only: %i[index]
  resources :shop_lists
  resources :edamams, only: %i[index]
  resources :password_resets, only: %i[create edit update new]
  resource :profile, only: %i[show edit update]

  resources :recipes, only: %i[index show new create edit update destroy] do
    resources :recipe_comments, only: %i[create destroy], shallow: true
    collection do
      get :favorite_recipes
    end
  end
  resources :favorite_recipes, only: %i[index create destroy]

  resources :wisdom_boards, only: %i[index show new create edit update destroy] do
    resources :wisdom_comments, only: %i[create destroy], shallow: true
    collection do
      get :favorite_wisdoms
    end
  end
  resources :favorite_wisdoms, only: %i[index create destroy]

  resources :contacts, only: %i[new create complete]
end
