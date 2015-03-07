Rails.application.routes.draw do
 
root 'critiques#index'
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

  

  
  get '/:id', :to => "users#show", as: 'profile'
  
  

end
