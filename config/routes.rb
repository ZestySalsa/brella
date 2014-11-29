Rails.application.routes.draw do
<<<<<<< HEAD
	get '/auth/:provider/callback', to: 'sessions#create', as: "new_session"
	
	resources :tweets, only: [:create]
=======
	get 'auth/:provider/callback', to 'sessions#create'
>>>>>>> master

  root to: "home#index"
end
