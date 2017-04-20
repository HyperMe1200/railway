Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'
  resources :trains do
    resources :carriages
  end
  resources :railway_stations do
    patch :update_station_number, on: :member
  end
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
