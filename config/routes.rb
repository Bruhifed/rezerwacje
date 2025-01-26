Rails.application.routes.draw do
  namespace :admin do
    get "room_equipments/index"
    get "room_equipments/new"
    get "room_equipments/create"
    get "room_equipments/edit"
    get "room_equipments/update"
    get "room_equipments/destroy"
    get "rooms/index"
    get "rooms/new"
    get "rooms/create"
    get "rooms/edit"
    get "rooms/update"
    get "rooms/destroy"
  end
  get "bookings/index"
  get "bookings/new"
  get "bookings/create"
  get "bookings/edit"
  get "bookings/update"
  get "bookings/destroy"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "users/new"
  get "users/create"
  get "pages/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  #
  # Strona główna
  root 'pages#home'

  # Rejestracja użytkownika
  get 'register', to: 'users#new'
  post 'register', to: 'users#create'

  # Logowanie i wylogowanie
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy", as: :logout

  # Rezerwacje
  resources :bookings, only: [:index, :new, :create, :edit, :update, :destroy]


  # Zarządzanie pokojami (administrator)
  namespace :admin do
    resources :rooms, except: [:show]
    resources :room_equipments, except: [:show]
  end
end
