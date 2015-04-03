Rails.application.routes.draw do
  root 'home#index'

  resources :profiles
  devise_for :users
  devise_scope :user do
    get 'login', :to => 'devise/sessions#new'
    post 'login', :to => 'devise/sessions#new'
    get 'register', :to => 'devise/registrations#new'
    get 'logout', to: 'devise/sessions#destroy'

  end
  resources :videos do
    resources :comments
  end

  resources :songs do
   resources :scomments
  end

end
