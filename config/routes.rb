Rails.application.routes.draw do
  get '/cars', to: 'cars#index'

  get '/dealers', to: 'dealers#index'
  get '/dealers/new', to: 'dealers#new'
  post '/dealers', to: "dealers#create"
  get '/dealers/:id/edit', to: 'dealers#edit'
  patch '/dealers/:id', to: 'dealers#update'
  get '/cars/:id/edit', to: 'cars#edit'
  patch '/cars/:id', to: 'cars#update'
  delete '/dealers/:id', to: 'dealers#destroy'

  get '/cars/:id', to: 'cars#show'
  get '/dealers/:id', to: 'dealers#show'
  get '/dealers/:id/cars', to: 'dealer_cars#index'
  get '/dealers/:id/cars/new', to: 'dealer_cars#new'
  post '/dealers/:id/cars', to: 'dealer_cars#create'
  delete '/cars/:id', to: 'cars#destroy'
end
