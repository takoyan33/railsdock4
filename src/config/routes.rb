Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  get 'user_edit', to: 'users#edit'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  # root 'boards#index'
  resources :users, only: %i[new create edit update]
  resources :boards
  resources :comments, only: %i[create destroy]
end
