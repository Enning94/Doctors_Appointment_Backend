Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
