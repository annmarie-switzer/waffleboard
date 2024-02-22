Rails.application.routes.draw do
  root 'games#index'

  resources :teams, only: %i[index show] do
    get 'players', on: :member, to: 'teams#players'
    get 'games', on: :member, to: 'teams#games'
  end

  resources :games, only: %i[index show]

  resources :players, only: %i[index show]
end
