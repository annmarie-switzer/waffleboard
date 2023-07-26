class TeamsController < ApplicationController
  def index
    teams = Team.all
    render json: teams
  end

  def show
    team = Team.find(params[:id])
    render json: team
  end

  def players
    team = Team.find(params[:team_id])
    players = team.players
    render json: players
  end
end
