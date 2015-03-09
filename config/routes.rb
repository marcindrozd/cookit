Rails.application.routes.draw do
  root 'pages#front'

  get '/home', to: "recipes#index"

  get '/register', to: "users#new"
  get '/sign_in', to: "sessions#new"
  post '/sign_in', to: "sessions#create"
  delete '/sign_out', to: "sessions#destroy"

  resources :recipes do
    collection do
      get '/search', to: "recipes#search"
    end
  end

  resources :users, only: [:create, :show]

  get 'ui(/:action)', controller: 'ui'
end
