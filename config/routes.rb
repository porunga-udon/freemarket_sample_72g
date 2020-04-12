Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  root to: 'goods#index'
  resources :users, only:[:show, :destroy]

 

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  
  resources :goods, only:[:index, :show, :new, :create] do
    resources :good_images, only: [:index, :new, :create]
  end
  resources :orders, only:[:index] # 商品購入確認画面へ

  namespace :api do
    resources controller: :goods, only: :child, defaults: { format: 'json' } do
      collection do
        get 'child'
      end
    end
    resources controller: :goods, only: :grand_child, defaults: { format: 'json' } do
      collection do
        get 'grand_child'
      end
    end
  end
  
end
