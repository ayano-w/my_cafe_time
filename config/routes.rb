Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:update, :destroy, :show]
  resources :caves do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :categories, only: [:create, :destroy]

end
