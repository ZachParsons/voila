Rails.application.routes.draw do
  resources :users, :sessions

  resources :illusions

  get '/illusions', to: 'illusions#index', as: 'masters_illusions'

  # namespace :masters do
  #   resource :illusions, controller: :illusions, only: [:index],
  # end

  get '/users/new/masters', to: 'users#new_master', as: :new_master

end
