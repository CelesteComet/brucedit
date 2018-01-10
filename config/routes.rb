Rails.application.routes.draw do


  resources :users, only: [:new, :create]
  resources :subs do
    resources :posts
  end
  resource :session

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
