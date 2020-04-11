Rails.application.routes.draw do
  devise_for :users
  root to: 'goods#index'
  resources :users, only:[:show, :destroy]
  resources :cards, only:[:new]
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
