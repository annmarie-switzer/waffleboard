class Teams::PlayersController < ApplicationController
  def index
    team = Team.find(params[:team_id])
    players = team.players
    render json: players
  end
end
