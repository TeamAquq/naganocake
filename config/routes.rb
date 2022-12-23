Rails.application.routes.draw do

<<<<<<< HEAD
  namespace :admin do
    resources :orders, only:[:index, :show, :update]
    get "orders/current_user_order/:id" => "orders#current_user_order"
    get 'homes/top'
  end

  root 'public/homes#top'
  get 'about' => 'pubric/homes#about'

  namespace :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
  end

  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'customers/confirm'
    get 'customers/edit'
    get 'customers/show'
  end


  namespace :admin do
    get 'orders/show'
    get 'orders/index'
  end
  
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/finish'
    get 'orders/index'
    get 'orders/show'
  end


=======
>>>>>>> origin/develop2
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  root 'public/homes#top'
  get 'about' => 'public/homes#about'

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end

  scope module: :public do
    delete 'destroy_all' => 'cart_items#destroy_all'
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get  'complete'
      end
  end
    resource  :customers, only: [ :show, :edit, :update] do

      get 'confirm'
      patch 'withdrawal'


       collection do
        get 'quit'
        patch 'out'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end





