Rails.application.routes.draw do
  devise_for :users#, skip: {}

  # as :user do
  #   post 'signin', to: 'devise/sessions#new', as: :user_session
  #   delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end
  root "homepage#index"
  resources :users, except: :new do
    resources :packets do
      resources :words
    end
  end

end
