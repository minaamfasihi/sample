Rails.application.routes.draw do
  resources :comments
  resources :todo_lists
  resources :campaigns
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end