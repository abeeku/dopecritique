Rails.application.routes.draw do
 

 

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
root 'pages#home'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

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
devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
 	resources :users
delete 'artists/unfollow/:artist_id' => 'followers#destroy', :as => "unfollow_artist"
  
  match 'artists/follow/:artist_id' => 'followers#create', :as => "follow_artist", via: [:get, :post]
  get '/search', to: 'music#search'

  
  get '/:id', :to => "users#show", as: 'profile'
  
  

end
