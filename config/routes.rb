Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "pages/offer_category", to: "pages#offer_category", as: :offer_category
  get "pages/sale_rent", to: "pages#sale_rent", as: :sale_rent
  resources :offers, only: %i[index new create show destroy]
  resources :rents, only: %i[index new create show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
