Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/signup',  to: 'users#create'
  get  '/signup',  to: 'users#new'

  get  '/insurance_plan', to: 'users#insurance_plan'

  resources :diagnosis_codes
  resources :users do
    member do
      get 'check_valid_diagnosis'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
