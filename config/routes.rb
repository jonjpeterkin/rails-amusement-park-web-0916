Rails.application.routes.draw do
	resources :users 
	resources :attractions 
	resources :sessions, only: [:create, :destroy]

	get '/', to: 'welcome#index', as: 'homepage'
	get '/signin', to: 'sessions#new', as: 'login' 
	

end