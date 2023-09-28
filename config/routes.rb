Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    root "doctors#index"
    resources :patients
    resources :locations
    resources :doctors
    resources :appointments
  end

end
