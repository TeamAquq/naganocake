Rails.application.routes.draw do
  namespace :admin do
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

  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
