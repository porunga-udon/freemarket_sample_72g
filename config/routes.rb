Rails.application.routes.draw do
  devise_for :users
  root to: 'goods#index'
  resources :users, only:[:show, :destroy]
  resources :cards, only:[:new]
  resources :goods, only:[:index, :show, :new] do
    resources :good_images, only: [:index]
  end
end
