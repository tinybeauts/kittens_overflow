KittensOverflow::Application.routes.draw do
  root :to => 'pages#home'
  
  # resources :users

  # resources :images, only: [:show] do
  #   resources :stories, only: [:show, :create]
  # end


  match '/users' => 'users#create', :via => [:post]

  match '/images/:id' => 'images#show', :via => [:get], :as => 'image'
  match '/images/:image_id/stories' => 'stories#create', :via => [:post], :as => 'image_stories'
  match '/images/:image_id/stories/:id' => 'stories#show', :via => [:get], :as => 'image_story'
  
  match '/login' => 'sessions#create', :via => [:post]
  match '/logout' => 'sessions#destroy', :via => [:delete]
  post '/vote/:object_type/:object_id' => 'votes#create', as: 'new_vote'
end
