Rails.application.routes.draw do
  root 'teams#index'

  resources :teams do
    resources :players
  end

  resources :teams
  resources :games
end
