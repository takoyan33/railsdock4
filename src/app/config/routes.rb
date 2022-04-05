Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  get 'user_edit', to: 'users#edit'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'about', to: 'application#about'
  get 'contact', to: 'application#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  # root 'boards#index'
  resources :users, only: %i[new create edit update show]
  resources :boards
  resources :comments, only: %i[create destroy]

  resources :contacts
  # only: %i[:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'contact_confirm'
  post 'contacts/index', to: 'contacts#index', as: 'contact_index'
  post 'contacts/done', to: 'contacts#done', as: 'contact_done'
end
