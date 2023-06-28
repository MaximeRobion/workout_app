Rails.application.routes.draw do
  get 'workouts/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "workouts#index"

  resources :workouts do
    resources :exercises do
      resources :movements
    end
  end
end
