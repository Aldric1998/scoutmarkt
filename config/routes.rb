Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "pages/offer_category", to: "pages#offer_category", as: :offer_category
  resources :offers, only: %i[index new create show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
