Ideas::Application.routes.draw do
  get '/', to: 'ideas#index', as: 'root'
  get '/ideas', to: 'ideas#index', as: 'ideas'
  post '/ideas', to: 'ideas#create'
  get '/ideas/new', to: 'ideas#new', as: 'new_idea'
  get '/ideas/:id/edit', to: 'ideas#edit', as: 'edit_idea'
  get '/ideas/:id', to: 'ideas#show', as: 'idea'
  put '/ideas/:id', to: 'ideas#update'
  patch '/ideas/:id', to: 'ideas#update'
  delete '/ideas/:id', to: 'ideas#destroy'
end