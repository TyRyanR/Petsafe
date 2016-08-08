Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :emergencies, only: [:new, :create, :update]

  resource :session

  root "welcome#index"

end
