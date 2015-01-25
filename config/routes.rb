Rails.application.routes.draw do
  resources :artists

 	resources :users

  resources :musics do
  	member { post :like }
  end

  resources :critiques
  get '/:username', :to => "profiles#show"
  devise_for :users
  root 'critiques#index'

end
