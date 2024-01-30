# config/routes.rb
Rails.application.routes.draw do
  # Resourceful routes for the 'books' model
  resources :books

  # Define your root route (the Home Page)
  root 'books#index'
end
