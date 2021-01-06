Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'details', to: 'users/registrations#new_detail'
    post 'details', to: 'users/registrations#create_detail'
  end
  root to:"items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
  end
end
