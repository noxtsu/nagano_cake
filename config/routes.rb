Rails.application.routes.draw do
  namespace :public do
  #  get 'cart_items/index'
  #  get 'cart_items/update'
  #  get 'cart_items/destroy'
  #  get 'cart_items/destroy_all'
  #  get 'cart_items/create'
  end
 # namespace :admin do
  #  get 'customers/index'
  #  get 'customers/show'
  #  get 'customers/edit'
  #  patch 'customers/update'
 #end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
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
    patch 'addresses/:id' => 'addresses#update'
    delete 'addresses/:id' => 'addresses#destroy'

    get 'cart_items' => 'cart_items#index'
    patch 'cart_items/:id' => 'cart_items#update'
    delete 'cart_items/:id' => 'cart_items#destroy'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    post 'cart_items' => 'cart_items#create'
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
