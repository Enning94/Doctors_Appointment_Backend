Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      root "doctors#index"
      resources :appointments
      resources :doctors
      resources :patients
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end


Write unit test for doctor index action 
Write unit test for doctor show action 
Write unit test for doctor create action 
Write unit test for doctor delete action 