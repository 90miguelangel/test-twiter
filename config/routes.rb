Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    get 'followers'
    get 'following'
    get 'tweets'
    get 'feed'
  end

  resources :relationships, only: [:create, :destroy]
  resources :tweets, only: [:create, :destroy]
end
