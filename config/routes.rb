Rails.application.routes.draw do
	root "widgets#index"
	resources :widgets,only: [:index,:new,:create]
	resources :user_sessions,only: [:new,:create,:destroy]
	resources :users,only: [:new,:create]
	resources :password,only: [:new,:create,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
