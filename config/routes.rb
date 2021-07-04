Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :likes, only:[:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # 追加
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
      get :complete
    end
  end
end
