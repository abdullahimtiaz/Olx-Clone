Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    # get 'users/new'
    resources :users #   'users/create'
    post   'users/login',   to: 'sessions#create'
    put    'users/update'
    get 'users/items/:user_id', to: 'users#user_items'
    # post 'items/purchase', to: 'items#purchase'
    resources :items
    resource :shopping_cart



  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
