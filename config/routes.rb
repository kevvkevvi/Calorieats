Rottenpotatoes::Application.routes.draw do
  get 'calculator/index'

  get 'users/login'
  get 'users/loginprocess'
  post 'users/login', to: 'users#loginprocess'

  get 'users/register'
  get 'users/registerprocess'
  post 'users/register', to: 'users#registerprocess'

  get 'users/logout'

  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
