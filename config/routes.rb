Rottenpotatoes::Application.routes.draw do
  get 'calculator/index'

  get 'market/index'

  get 'users/login'
  get 'users/loginprocess'
  post 'users/login', to: 'users#loginprocess'

  get 'users/register'
  get 'users/registerprocess'
  post 'users/register', to: 'users#registerprocess'

  get 'users/logout'

  get 'calculator/recommendation'
  get 'market/cart'
  post 'calculator/index', to: 'calculator#recommendation'
  post 'market/index', to: 'market#cart'

  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/users/login')
end
