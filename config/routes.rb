Rails.application.routes.draw do
  devise_for :users

  resource :search, only: [:create, :show]
  resources :tickets

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end

    resources :railway_stations do
      patch :update_station_number, on: :member
      patch :update_time, on: :member
    end

    resources :routes
    resources :tickets
  end

  get 'welcome/index'

  root 'searches#show'
end
