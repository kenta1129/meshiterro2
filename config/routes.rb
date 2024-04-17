Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :favorite, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy, :index]
  
end
  
  resources :users, only: [:show, :edit, :update]

  
  
  devise_scope :user do
  get '/users/sign_out', to: 'devise/sessions#destroy'
end

end