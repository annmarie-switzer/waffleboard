class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def players
    @team = Team.find(params[:team_id])
    @players = @team.players
  end
end
