Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "homepages#home"
  get "/home", to:"homepages#home"
  get "/product", to: "products#products"
  get "/contactus", to: "contact_us#contactus"
  get "/product/show/:id", to: "products#show" , as:"product_show"
  get "product/new", to: "products#new"
  post "product/new", to: "products#create",  as: "products"
  delete "product/destroy/:id", to: "products#destroy", as:"destroy_me"
  get "product/:id/edit" , to: "products#edit", as:"product_edit" 
  patch "product/:id/edit", to: "products#update" 
  put "product/:id", to: "products#update" 
  resources :books
  resources :authors
  resources :students
  resources :faculties
  get "employees/results", to: "employees#results"
  resources :employees do
    post :increase_order #setting post route for button to increase order
    post :decrease_order #setting post route for button to deccrease order
  end
  get "aqproducts/seperate", to: "aqproducts#seperate"
  resources :aqproducts
  resources :customers
  get "orders/root", to: "orders#root"
  resources :orders
  
  
  # Defines the root path route ("/")
  # root "articles#index"
end
