Rails.application.routes.draw do
  resources :users, :sessions

  get '/users/new/masters', to: 'users#new_master', as: :new_master

end
