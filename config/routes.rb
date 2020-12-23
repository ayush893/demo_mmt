Rails.application.routes.draw do
  devise_for :mmts,
      path: '',
      path_names: {
         sign_in: 'login',
         sign_out: 'logout',
         registration: 'signup'
      },
      controllers: {
         sessions: 'sessions',
         registrations: 'registrations'
      }

    namespace :api do
      namespace :v1 do
        jsonapi_resources :mmts
      end
    end
  end