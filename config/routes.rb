Rails.application.routes.draw do
  get '/home', to: "recipes#index"

  resources :recipes, only: [:show] do
    collection do
      get '/search', to: "recipes#search"
    end
  end

  get 'ui(/:action)', controller: 'ui'
end
