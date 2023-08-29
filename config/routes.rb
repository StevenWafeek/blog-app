Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: %i[index show] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end
end
