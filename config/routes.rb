Rails.application.routes.draw do

  resources :categories, shallow: true, only: [:show] do
    resources :topics, only: [:new, :create, :edit, :update, :destroy, :show] do
      resources :posts, only: [:new, :create, :edit, :update, :destroy, :show]
    end
  end

  resources :users do
    post :do_verify_email
    get :verify_email
  end
  resource  :session, only: [:index, :new, :create, :show, :destroy]

  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
