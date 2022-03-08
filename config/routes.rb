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
  # Defines the root path route ("/")
  # root "articles#index"
end
