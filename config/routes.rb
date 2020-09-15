Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'api/public' => 'public#public'
  get 'api/private' => 'private#private'

  resource :users, only: [:create]
  resource :nominations, only: [:create, :index, :update]
  # /login
  post '/login' => "authentication#login"
end
