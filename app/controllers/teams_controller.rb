class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def players
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def games
    @team = Team.find(params[:id])
    @games = Game.where("home_team_id = ? OR away_team_id = ?", @team.id, @team.id)
  end
end
