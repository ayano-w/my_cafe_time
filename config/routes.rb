Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:update]
  get 'users/mypage' => 'users#show', as: 'mypage'

  resources :caves do
    resources :favorites, only: [:create, :destroy]
  end
  resources :categories, only: [:create, :destroy]

end
