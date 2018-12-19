Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"
  get "/about", to: "pages#about"

  resources :todos do
      get 'comments'
      get 'fart'
      put 'fart'
  end
end
