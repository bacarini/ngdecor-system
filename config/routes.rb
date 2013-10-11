NgdecorSystem::Application.routes.draw do
  scope "(:locale)", locale: "/#{I18n.available_locales.join("|")}/" do
    get "user/index"
    devise_for :users
    root to: "user#index"
  end
end
