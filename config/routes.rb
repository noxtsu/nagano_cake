Rails.application.routes.draw do

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end


  scope module: :public do
    get 'customers/my_page' => 'customers#show', as: 'mypage'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    get 'items' => 'items#index'
    get 'items/:id' => 'items#show', as: 'item'

    get 'addresses' => 'addresses#index'
    get 'addresses/:id/edit' => 'addresses#edit', as: 'edit_address'
    post 'addresses' => 'addresses#create'
    patch 'addresses/:id' => 'addresses#update', as: 'update_address'
    delete 'addresses/:id' => 'addresses#destroy', as: 'destroy_address'

    get 'cart_items' => 'cart_items#index'
    patch 'cart_items/:id' => 'cart_items#update'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'cart_item'
    post 'cart_items' => 'cart_items#create'

    get 'orders/new' => 'orders#new'
    post 'orders/comfirm' => 'orders#comfirm'
    get 'orders/complete' => 'orders#complete'
    post 'orders' => 'orders#create', as: 'create_order'
    get 'orders' => 'orders#index', as: 'orders'
    get 'orders/:id' => 'orders#show', as: 'order'

  end

  devise_for :customers, skip: [:passwords],
  controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords],
  controllers: {
    sessions: "admin/sessions"
  }


  #namespace :public do
  # resources :items, only: [:index, :show]
  #  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get 'about' => 'homes#about'
  get 'admin' => 'admin/homes#top'

end
