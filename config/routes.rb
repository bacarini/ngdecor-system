NgdecorSystem::Application.routes.draw do

  devise_for :users

  resources :users
  resources :customers
  resources :imports, only: [:new,:create]
  resources :products 
  resources :categories
  resources :suppliers do
    get 'download'
  end

  root "users#index"
end
