Rails.application.routes.draw do
  resources :comments
  resources :todo_lists
  resources :campaigns
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'
  devise_scope :user do
    get 'users/:id/edit_status' => 'users/registrations#edit_status', as: :edit_user_status
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
