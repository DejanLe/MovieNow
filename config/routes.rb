Rails.application.routes.draw do
  resources :moviers do
      resources :comments 
  end
  devise_for :users

  root "moviers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
