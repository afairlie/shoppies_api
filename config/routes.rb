Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'api/public' => 'public#public'
  get 'api/private' => 'private#private'
end
