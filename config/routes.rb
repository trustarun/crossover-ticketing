Rails.application.routes.draw do
  root 'tickets#index'
  devise_for :users
  resources :tickets
  resources :statuses, only: [:index]
  resources :users
  resources :priorities, only: [:index]
  resources :categories, only: [:index]
  
  delete "admin/delete_user/:id" => "admin/settings#delete_user", as: :admin_user_delete

  namespace :admin do
  	resources :settings, only: [:index] do
  		collection do
  			get 'tickets'
        get 'manage_users'
        post 'create_user'
  		end
  	end
  end
end
