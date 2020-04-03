Rails.application.routes.draw do
  root to: 'goods#index'
  resources :goods, only: [:index] do
    resources :good_images, only: [:index]
  end
end
