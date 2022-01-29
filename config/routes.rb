Rails.application.routes.draw do
  
  devise_for :admin
  devise_for :customers
  
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
