Rails.application.routes.draw do
  devise_for :users
  root to: "castles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :castles do
    collection do
      get :my_castles
    end
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  # Defines the root path route ("/")
  # root "posts#index"
end
