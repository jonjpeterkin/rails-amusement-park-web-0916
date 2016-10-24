Rails.application.routes.draw do
	resources :users 
	resources :attractions 
	resources :sessions, only: [:create, :destroy]


	get '/', to: 'welcome#index', as: 'homepage'
	get '/login', to: 'sessions#new', as: 'login' 
	

end