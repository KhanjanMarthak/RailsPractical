Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    root "homepages#home"
    get "/home", to:"homepages#home"
    get "/product", to: "products#products"
    get "/contactus", to: "contact_us#contactus"
    get "/product/show", to: "products#show", id:/\d+/
    get "product/new", to: "products#new"
    post "product/new", to: "products#create",  as: "products"
    
  # Defines the root path route ("/")
  # root "articles#index"
end
