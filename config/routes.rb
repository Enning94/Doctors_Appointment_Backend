Rails.application.routes.draw do
  resources :appointments
  resources :doctors
  resources :patients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    root "doctors#index"
          end

  # Defines the root path route ("/")
  # root "articles#index"
end
