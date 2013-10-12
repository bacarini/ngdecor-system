NgdecorSystem::Application.routes.draw do
  scope "(:locale)", locale: "/#{I18n.available_locales.join("|")}/" do
    devise_for :users
    resources :users
    root to: "users#index"
  end
end
