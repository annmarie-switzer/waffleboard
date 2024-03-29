# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_22_040638) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "home_team_id", null: false
    t.bigint "away_team_id", null: false
    t.string "uuid", null: false
    t.string "status"
    t.datetime "scheduled"
    t.integer "home_points"
    t.integer "away_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "nhl_id"
    t.string "status"
    t.string "full_name"
    t.string "first_name"
    t.string "last_name"
    t.string "abbr_name"
    t.integer "height"
    t.integer "weight"
    t.string "handedness"
    t.string "position"
    t.string "primary_position"
    t.integer "jersey_number"
    t.string "college"
    t.integer "experience"
    t.string "birth_place"
    t.date "birthdate"
    t.integer "rookie_year"
    t.string "draft_team_id"
    t.integer "draft_year"
    t.integer "draft_round"
    t.integer "draft_pick"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "nhl_id"
    t.string "name"
    t.string "market"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo"
  end

  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "home_team_id"
  add_foreign_key "players", "teams"
end
