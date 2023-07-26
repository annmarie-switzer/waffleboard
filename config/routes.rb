Rails.application.routes.draw do
  resources :teams, only: %i[index show] do
    resources :players, only: %i[index show], controller: 'teams/players'
  end

  resources :games, only: %i[index show]
end
