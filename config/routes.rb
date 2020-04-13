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
  
  
  resources :goods, only:[:index, :show, :new, :create, :destroy] do
    resources :good_images, only: [:index, :new, :create]
  end

  
  resources :orders, only: [:index] do
    collection do
      get 'index', to: 'orders#index'
      post 'pay', to: 'orders#pay'
      get 'done', to: 'orders#done'
    end
  end

  resources :users, only:[:goods_list] do
    member do
      get 'goods_list'
    end
  end

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
