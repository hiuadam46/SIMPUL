Rails.application.routes.draw do
  devise_for :users
  get "/", to:"home#index"
  resources :room
  get "/chats", to:"room#index"
  get "/chats/:key_room", to:"room#index"
  post "/message/send", to:"room#sendThisMessage"
  post "/message/get", to:"room#getThisMessage"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
