Rails.application.routes.draw do
  resources :teams, only: %i[index show] do
    resources :players, only: %i[index show], to: 'teams#players'
  end

  resources :games, only: %i[index show] do
    get 'players', on: :member, to: 'games#players'
  end

  resources :players, only: %i[index show]
end
