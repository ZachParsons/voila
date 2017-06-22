Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :illusions

  get '/illusions', to: 'illusions#index', as: 'masters_illusions'

  # namespace :masters do
  #   resource :illusions, controller: :illusions, only: [:index],
  # end

  get '/users/new/masters', to: 'users#new_master', as: :new_master

end
