Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  get '/users/new/masters', to: 'users#new_master', as: :new_master

end
