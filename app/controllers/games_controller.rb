class GamesController < ApplicationController
  def index
    @games = Game
            .includes(:home_team, :away_team)
            .where(scheduled: (1.year + 4.months).ago.all_day)
            .order(scheduled: :asc)
            .each_with_object({}) do |game, hash|
              stats = generate_random_stats
              hash[game.id] = {
                home: {
                  team: game.home_team,
                  stats: stats[:home]
                },
                away: {
                  team: game.away_team,
                  stats: stats[:away]
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
    puckline = random_puckline
    home_moneyline = random_moneyline
    away_moneyline = random_moneyline

    if (home_moneyline > 0 && away_moneyline > 0) || (home_moneyline < 0 && away_moneyline < 0)
      if [true, false].sample
        home_moneyline = -home_moneyline
      else
        away_moneyline = -away_moneyline
      end
    end

    {
      home: {
        moneyline: format_number(home_moneyline),
        puckline: format_number(puckline)
      },
      away: {
        moneyline: format_number(away_moneyline),
        puckline: format_number(-puckline)
      }
    }
  end

  def random_moneyline
    rand(101..300) * [-1, 1].sample
  end

  def random_puckline
    rand(-1.5..1.5).round(1)
  end

  def random_totals
    total = rand(5.5..7.5).round(1)
    {
      over: format_number(total),
      under: format_number(-total)
    }
  end

  def format_number(num)
    num.positive? ? "+#{num}" : num.to_s
  end
end
