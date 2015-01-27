Rails.application.routes.draw do
  resources :musics

  resources :artists do
  	resources :musics do
  	member { post :like }
  end
  end
devise_for :users
 	resources :users

  

  resources :critiques
  get '/:id', :to => "users#show", as: 'profile'
  
  root 'critiques#index'

end
