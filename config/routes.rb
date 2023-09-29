Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    root "doctors#index"
    resources :appointments
    resources :doctors
    resources :patients
          end

  # Defines the root path route ("/")
  # root "articles#index"
end
