Rails.application.routes.draw do

  get 'post/new'

  get 'post/create'

  get 'post/edit'

  get 'post/update'

  get 'post/destroy'

  get 'post/show'

  resources :categories, shallow: true, only: [:show] do
    resources :topics, only: [:new, :create, :edit, :update, :destroy, :show] do
      resources :posts, only: [:new, :create, :edit, :update, :destroy, :show]
    end
  end

  resources :users
  resource  :session, only: [:index, :new, :create, :show, :destroy]

  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
