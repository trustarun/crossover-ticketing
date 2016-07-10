Rails.application.routes.draw do
  root 'tickets#index'
  devise_for :users
  resources :tickets
  resources :statuses, only: [:index]
  namespace :admin do
  	resources :settings, only: [:index] do
  		collection do
  			get 'tickets'
  		end
  	end
  end
end
