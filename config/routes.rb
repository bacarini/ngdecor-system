NgdecorSystem::Application.routes.draw do
  resources :categories

  resources :suppliers

  LOCALES = /#{I18n.available_locales.join("|")}/

  scope "(:locale)", locale: LOCALES do
    devise_for :users

    resources :users
    resources :customers
    resources :imports, only: [:new,:create]
  end

  get '/:locale' => 'users#index', locale: LOCALES
  root "users#index"
end
