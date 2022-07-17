Rails.application.routes.draw do
  root 'welcomes#index' 
  resources :users
  get 'mypage', to: 'users#me'
  get 'user_edit', to: 'users#edit'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'about', to: 'application#about'
  get 'contact', to: 'application#contact'
  
  # root 'home#index'
  # root 'boards#index'
  # , only: %i[new create edit update show]
  resources :boards do
    resources :likes, only: [:create, :destroy]
  end
  resources :comments, only: %i[create destroy]

  resources :contacts
  post 'contacts/confirm', to: 'contacts#confirm', as: 'contact_confirm'
  post 'contacts/index', to: 'contacts#index', as: 'contact_index'
  post 'contacts/done', to: 'contacts#done', as: 'contact_done'

  get "search" => "searches#search"
end
