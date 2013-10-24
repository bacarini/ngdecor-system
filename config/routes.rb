NgdecorSystem::Application.routes.draw do
  LOCALES = /#{I18n.available_locales.join("|")}/

  scope "(:locale)", locale: LOCALES do
    devise_for :users

    resources :users
    resources :customers
    resources :imports, only: [:new,:create]
    resources :products
    resources :categories
    resources :suppliers
  end

  get '/:locale' => 'users#index', locale: LOCALES
  root "users#index"
end
