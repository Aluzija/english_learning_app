Rails.application.routes.draw do
  devise_for :users#, skip: {}

  # as :user do
  #   post 'signin', to: 'devise/sessions#new', as: :user_session
  #   delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end
  root "homepage#index"
  resources :users, only: :index do
    resources :packets, only: [:index, :create, :destroy] do
      resources :words, except: :show
      namespace :words do
        resources :learning_session, only: :create do
          member do
            get "question_type_1"
          end
        end
      end
    end
  end

end
