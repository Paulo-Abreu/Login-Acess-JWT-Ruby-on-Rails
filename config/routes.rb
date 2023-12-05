Rails.application.routes.draw do
  resources :users, param: :name
  namespace :api do
    namespace :v1 do
      post 'auth/login', to: 'authentication#login'
      post 'auth/logout', to: 'authentication#logout'
    end
  end

  root 'pages#home'
end
