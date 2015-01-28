Rails.application.routes.draw do
 

  resources :artists do
  	member { post :like }
  	resources :musics do
  		member { post :like }
  	end
  end
devise_for :users
 	resources :users

  

  resources :critiques do
  	member {post :like}
  end
  get '/:id', :to => "users#show", as: 'profile'
  
  root 'critiques#index'

end
