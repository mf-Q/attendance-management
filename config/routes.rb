Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root  'users#index'
  resources :users do
    resources :schedules
      match 'schedules', to: 'schedules#edit', via: [:patch]
  
  end
end
