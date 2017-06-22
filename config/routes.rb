Rails.application.routes.draw do
  resources :users, :sessions, :tags, :illusions

  get '/illusions', to: 'illusions#index', as: 'masters_illusions'

  get '/users/new/masters', to: 'users#new_master', as: :new_master
  root 'tags#index'
end
