Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index', as: :dashboard
  
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'users/edit_profile', to: 'users/registrations#edit_profile', as: :edit_profile
    put 'users/update_profile', to: 'users/registrations#update_profile', as: :update_profile
  end
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
