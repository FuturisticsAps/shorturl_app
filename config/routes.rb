Rails.application.routes.draw do
  get 'home/index'

  #get '/home/:slug', to: 'home#index'

  match '/:slug', to: 'home#redirect_url', via: [:get]

  post '/save-url', to: 'home#save_url'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root 'home#index'
end
