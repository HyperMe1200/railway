Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :trains do
    resources :carriages, shallow: true
  end

  resources :railway_stations do
    patch :update_station_number, on: :member
    patch :update_time, on: :member
  end

  resources :routes

  resource :search, only: [:create, :show]

  resources :tickets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
