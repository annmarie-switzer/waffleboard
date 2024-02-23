class GamesController < ApplicationController
  def index
    @games = Game
            .includes(:home_team, :away_team)
            .where(scheduled: (1.year + 4.months).ago.all_day)
            .order(scheduled: :asc)
            .each_with_object({}) do |game, hash|
              hash[game.id] = {
                home: {
                  team: game.home_team,
                  stats: generate_random_stats
                },
                away: {
                  team: game.away_team,
                  stats: generate_random_stats
                },
                totals: random_totals,
                scheduled: game.scheduled
              }
            end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def generate_random_stats
    {
      moneyline: random_moneyline,
      puckline: random_puckline
    }
  end

  def random_moneyline
    rand(-200..200)
  end

  def random_puckline
    rand(-1.5..1.5).round(1)
  end

  def random_totals
    {
      over: rand(5.5..7.5).round(1),
      under: rand(5.5..7.5).round(1)
    }
  end
end
