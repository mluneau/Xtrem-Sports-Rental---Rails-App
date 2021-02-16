Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipments do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [] do
    member { patch :update_rating }
    member { patch :accept }
    member { patch :deny }
    member { patch :cancel }
  end
  resource :account, only: [:show]

  get "categories", to: "pages#categories"
end
