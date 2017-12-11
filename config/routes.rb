Rails.application.routes.draw do
  devise_for :users#, skip: {}

  # as :user do
  #   post 'signin', to: 'devise/sessions#new', as: :user_session
  #   delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end
  root "homepage#index"
  resources :users, only: :index do
    resources :packets, only: :index
  end
  resources :packets, only: [:create, :destroy] do
    resources :words, only: [:index, :create, :new]
  end
  get "packets/:packet_id/words/too_many", to: "words#too_many", as: "packet_words_too_many"
  resources :words, only: [:edit, :update, :destroy]
  namespace :words do
    resources :repetition, only: :index  do
      member do
        get "ask"
      end
    end
    resources :learning_session, only: :create do
      member do
        get "question_type_1"
        get "question_type_2"
        get "question_type_4"
        get "question_type_5"
        get "manager"
      end
    end
  end

end
