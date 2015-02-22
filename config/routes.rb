Rails.application.routes.draw do
  root to: "home#index"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign_out', to: 'sessions#sign_out'

  resources :tweets, only: [:create]
end
