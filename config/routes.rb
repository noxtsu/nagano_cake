Rails.application.routes.draw do



    
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
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
