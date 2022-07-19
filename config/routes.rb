Rails.application.routes.draw do
  
  get 'users/index'
  get 'users/show'
  get 'chats/index'
  get 'chats/show'
  devise_for :circles, controllers: {
        sessions: 'circles/sessions'
      }
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    resources :users, :only => [:index, :show]
      get 'talk/:id' => 'talks#show', as: 'talk'
  resources :talks, only: [:create]
  
  
  resources :posts do
    resources :participations
  end
  resources :todos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chats

  # Defines the root path route ("/")
   root "todos#index"
   get "users/:id/relationships" => "relationships#followings"

   resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


end
