Rails.application.routes.draw do
  get '/home', to: "recipes#index"

  get '/register', to: "users#new"

  resources :recipes, only: [:show] do
    collection do
      get '/search', to: "recipes#search"
    end
  end

  resources :users, only: [:create]

  get 'ui(/:action)', controller: 'ui'
end
