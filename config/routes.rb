Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], 
  controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }  

  devise_for :admin, skip: [:registrations, :passwords],
  controllers: {
    sessions: "admin/sessions"
  }

  
  namespace :admin do
    resources :items
  end
  
  namespace :public do
    resources :items, only: [:index, :show]
  
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "homes#top"
  get 'about' => 'homes#about'
end
