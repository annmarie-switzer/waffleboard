class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def players
    game = Game.find(params[:id])
    home_players = game.home_team.players
    away_players = game.away_team.players
    render json: { home: home_players, away: away_players }
  end
end
