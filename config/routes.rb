Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/shop", controller: "products", action: "shop"
  get "/one_product/:id", controller: "products", action: "one_product"
  get "/all_products/:id", controller: "products", action: "all_products"
  # Defines the root path route ("/")
  # root "posts#index"
end
