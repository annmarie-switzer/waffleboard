# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Load dotenv only in development or test environment
Dotenv::Railtie.load if %w[development test].include? ENV['RAILS_ENV']

def seed_teams
  res = RestClient.get(
    "http://api.sportradar.us/nhl/trial/v7/en/seasons/2022/REG/rankings.json?api_key=#{ENV.fetch('API_KEY')}"
  )

  rankings_res = JSON.parse(res.body)

  teams = rankings_res['conferences'].reduce([]) do |result, conference|
    result + conference['divisions'].flat_map do |division|
      division['teams']
    end
  end

  teams.each do |team|
    Team.find_or_create_by(
      nhl_id: team['id'],
      name: team['name'],
      market: team['market']
    )
  end
end

seed_teams
