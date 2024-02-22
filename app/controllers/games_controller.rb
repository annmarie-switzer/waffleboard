class GamesController < ApplicationController
  def index
    @games = Game
            .includes(:home_team, :away_team)
            .where(scheduled: (1.year + 4.months).ago.all_day)
            .order(scheduled: :asc)
  end

  def show
    @game = Game.find(params[:id])
  end
end
