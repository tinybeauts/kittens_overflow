KittensOverflow::Application.routes.draw do
  root :to => 'pages#home'
  
  resources :users

  resources :images, only: [:show] do
    resources :stories, only: [:show, :create]
  end

  match '/login' => 'sessions#create', :via => [:post]
  match '/logout' => 'sessions#destroy', :via => [:delete]
  match '/vote/:object_type/:object_id' => 'votes#create', :via => [:post], as: 'new_vote'
end
