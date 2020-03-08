Rails.application.routes.draw do  
	root "home#index"
	resources :users
	resources :widgets,only: [:create]
	resources :user_sessions,only: [:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
