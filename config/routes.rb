Rails.application.routes.draw do
  devise_for :users
  root to: 'goods#index'
  resources :users, only:[:show, :destroy]
  resources :cards, only:[:new]
  resources :goods, only:[:index, :show, :new, :create] do
    resources :good_images, only: [:index, :new, :create]
  end
  resources :orders, only:[:index] # 商品購入確認画面へ
end
