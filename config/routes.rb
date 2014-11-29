Rails.application.routes.draw do
	get '/auth/:provider/callback', to: 'sessions#create', as: "new_session"
	
	resources :tweets, only: [:create]

  root to: "home#index"
end
