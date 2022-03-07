Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    root "homepages#home"
    get "/home", to:"homepages#home"
    get "/about", to: "abouts#aboutus"
    get "/contactus", to: "contact_us#contactus"
  # Defines the root path route ("/")
  # root "articles#index"
end
