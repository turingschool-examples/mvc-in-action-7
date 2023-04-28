Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/comedians", to: "comedians#index"
  get "/comedians/:id", to: "comedians#show"
end
