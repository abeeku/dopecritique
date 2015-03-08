Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
