Catcontacts::Engine.routes.draw do
  resources :clients
  resources :emails
  resources :telephones
  resources :contacts
  resources :addresses do
    member do
      post :geocode
    end
  end
  resources :companies
end
