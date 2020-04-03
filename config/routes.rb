Rails.application.routes.draw do
  root to: 'goods#index'

  resources :goods, only:[:index, :show, :new]
end
