Rails.application.routes.draw do

  resources :categories, only: [:show] do

  end

  resources :users
  resource  :session, only: [:index, :new, :create, :show, :destroy]

  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
