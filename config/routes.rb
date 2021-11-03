Rails.application.routes.draw do
  devise_for :users
  root 'application#index'
  post 'add_tag', to: "recipes#add_tag"
  post 'add_recipe', to: "tags#add_recipe"
  post 'remove_recipe', to: "recipes#remove_tag"
  post 'search', to: "recipes#search"
  get 'search', to: "recipes#index"
  resources :recipes
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
