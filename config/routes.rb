Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'ranks/rank'
  devise_for :users
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :likes, only:[:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    collection do
      get 'search'
    end
  end

  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # 追加
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
      get :complete
    end
  end
end
