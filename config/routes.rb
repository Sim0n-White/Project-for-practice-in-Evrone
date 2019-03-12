Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  get 'lookchar/input'
  get 'lookchar/output'
  get 'compare/input'
  get 'compare/output'
  get 'home_page/input'
  get 'home_page/output'
  root 'home#index'
  resources :chars
  devise_for :users, controllers: {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
