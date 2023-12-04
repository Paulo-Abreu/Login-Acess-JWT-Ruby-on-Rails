Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      post 'login', to: 'authentication#login'
      post 'logout', to: 'authentication#logout'
    end
  end

  root 'pages#home'
end
