NgdecorSystem::Application.routes.draw do

  resources :sellers

  devise_for :users, path_prefix: 'my_user'
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
