Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  resource :nominations, only: [:create, :show]
  # /login
  post '/login' => "authentication#login"
end
