Rails.application.routes.draw do
  root 'tickets#my_tickets'
  devise_for :users
  resources :tickets
  resources :statuses, only: [:index]
  resources :users
  resources :priorities, only: [:index]
  resources :categories, only: [:index]
  resources :roles, only: [:index]

  delete 'admin/delete_user/:id' => 'admin/settings#delete_user', as: :admin_user_delete
  put 'user/:id/update_role' => 'users#update_role', as: :update_role
  get 'my_tickets' => 'tickets#my_tickets', as: :my_tickets

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
