Rails.application.routes.draw do

  namespace :admin do
    root "application#index"
    resources :projects, only: [:new, :create, :destroy]
    resources :users do
      member do
        patch :archive
      end # member
    end # resources
  end # namespace :admin

  devise_for :users
  
  root "projects#index"
  
  resources :projects, only: [:index, :edit, :update, :show] do
    resources :tickets
  end # projects

  resources :attachments, only: [:show, :new]

end # routes.draw
