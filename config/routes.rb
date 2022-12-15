Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
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
