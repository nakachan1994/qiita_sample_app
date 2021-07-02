Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :likes, only:[:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
