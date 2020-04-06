Rails.application.routes.draw do
  devise_for :users
  root to: 'goods#index'
  resources :goods, only:[:index, :show, :new, :create, :edit, :destroy] do
    resources :good_images, only: [:index]
  end
end
