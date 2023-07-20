# == Schema Information
#
# Table name: games
#
#  id           :bigint           not null, primary key
#  home_team_id :bigint           not null
#  away_team_id :bigint           not null
#  uuid         :string           not null
#  status       :string
#  scheduled    :datetime
#  home_points  :integer
#  away_points  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
