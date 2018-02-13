Rails.application.routes.draw do
  resources :emergency_locations
  resources :emergency_conditions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :emergency_conditions do
  	member do
  		get "accept_emergency"
      get "cancel_emergency"
  	end
  end

  post '/emergency_device' => 'emergency_devices#create' 
end
