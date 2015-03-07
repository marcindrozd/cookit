Rails.application.routes.draw do
  resources :recipes, only: [:index]

  get 'ui(/:action)', controller: 'ui'
end
