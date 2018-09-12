Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks do
    member do
      post 'complete', to: 'tasks#complete'
    end
  end
end
