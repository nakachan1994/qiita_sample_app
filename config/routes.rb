Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :posts do
    resources :comments
  end
end
