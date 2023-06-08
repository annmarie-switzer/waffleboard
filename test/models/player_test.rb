# == Schema Information
#
# Table name: players
#
#  id               :bigint           not null, primary key
#  nhl_id           :string
#  status           :string
#  full_name        :string
#  first_name       :string
#  last_name        :string
#  abbr_name        :string
#  height           :integer
#  weight           :integer
#  handedness       :string
#  position         :string
#  primary_position :string
#  jersey_number    :integer
#  college          :string
#  experience       :integer
#  birth_place      :string
#  birthdate        :date
#  rookie_year      :integer
#  draft_team_id    :string
#  draft_year       :integer
#  draft_round      :integer
#  draft_pick       :integer
#  team_id          :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
