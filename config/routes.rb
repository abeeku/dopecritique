Rails.application.routes.draw do
  resources :musics

  resources :critiques
  get '/:username', :to => "profiles#show"
  devise_for :users
  root 'critiques#index'

end
