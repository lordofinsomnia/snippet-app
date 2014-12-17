Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users
  resources :users
  resources :snippets do
  	resources :comments
  end

end
