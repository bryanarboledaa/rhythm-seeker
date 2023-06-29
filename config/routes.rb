Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users_devise/sessions',
    registrations: 'users_devise/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "discover#index"

  get "/discover", to: "discover#index"

  get "/upload", to: "upload#index"
  post "/upload", to: "upload#upload_track"

  get "/:display_name", to: "users#show", as: "user_profile"
end
