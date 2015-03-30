Rails.application.routes.draw do
 

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
root 'critiques#index'
resources :mixtapes
resources :critiques do
    member {post :like}
  end
  resources :artists do
  	member { post :like }
  	resources :musics do
  		member { post :like }
  	end
  end
devise_for :users
 	resources :users
delete 'artists/unfollow/:artist_id' => 'followers#destroy', :as => "unfollow_artist"
  
  match 'artists/follow/:artist_id' => 'followers#create', :as => "follow_artist", via: [:get, :post]
  get '/search', to: 'music#search'

  
  get '/:id', :to => "users#show", as: 'profile'
  
  

end
