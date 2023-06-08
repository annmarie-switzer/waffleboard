# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Load dotenv only in development or test environment
Dotenv::Railtie.load if %w[development test].include? ENV['RAILS_ENV']

def seed_teams
  rankings_res = RestClient.get(
    "http://api.sportradar.us/nhl/trial/v7/en/seasons/2022/REG/rankings.json?api_key=#{ENV.fetch('API_KEY')}"
  )

  rankings_data = JSON.parse(rankings_res.body)

  teams = rankings_data['conferences'].reduce([]) do |result, conference|
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

def seed_players
  file_path = Rails.root.join('db', 'teams.json')
  file_contents = File.read(file_path)
  teams_data = JSON.parse(file_contents)

  players = []

  teams_data.each do |team|
    team_instance = Team.find_by(nhl_id: team['id'])
    team['players'].each do |player_attrs|
      player_attrs['nhl_id'] = player_attrs['id']
      player_attrs.except!('id')
      player = Player.new(player_attrs.slice(*Player.column_names))
      player.team = team_instance
      players << player
    end
  end

  players.each(&:save!)
end

# seed_teams
# seed_players
