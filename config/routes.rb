Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only:[:index, :show, :update]
    get "orders/current_user_order/:id" => "orders#current_user_order"
  end
  
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/finish'
    get 'orders/index'
    get 'orders/show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
