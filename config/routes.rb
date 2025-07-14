Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  #OAuth
  # namespace :oauth do 
  #   namespace :google_oauth2 do 
  #     get "callback"
  #   end
  # end
end
