Rails.application.routes.draw do
  root 'home#index'

  resources :videos do
    resources :comments
  end

  devise_for :users, skip: [:sessions, :passwords, :confirmations, :registrations]
  as :user do
    # session handling
    get     '/login'  => 'devise/sessions#new',     as: 'new_user_session'
    post    '/login'  => 'devise/sessions#create',  as: 'user_session'
    get  '/logout' => 'devise/sessions#destroy', as: 'destroy_user_session'

    # joining
    get   '/join' => 'devise/registrations#new',    as: 'new_user_registration'
    post  '/join' => 'devise/registrations#create', as: 'user_registration'
    end
end
