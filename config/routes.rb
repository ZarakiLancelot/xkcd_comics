Rails.application.routes.draw do
  resources :comics do
    get 'next', to: 'comics#next'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "comics#index"
end
