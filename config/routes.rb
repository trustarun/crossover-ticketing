Rails.application.routes.draw do
  root 'tickets#index'
  devise_for :users
  resources :tickets
end
