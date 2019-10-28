Rails.application.routes.draw do
  get 'items/create'

  get 'items/destroy'

  get 'list' => 'items#list'

  post 'create_ao' => 'users#create_ao'

  get 'users' => 'items#new_user'

  post 'login_user' => 'users#login_user'

  get 'users/create_ao'

  post 'create_user' => 'users#create_user'

  post 'login' => 'users#login'

  post 'create_item' => 'items#create_item'

  get 'logout' => 'users#logout'

  get '' => 'users#home'

  post 'delete/:id' => 'items#destroy'

  post 'destroy/:id' => 'users#delete'

  get '*path' => 'users#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
