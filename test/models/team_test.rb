# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  nhl_id     :string
#  name       :string
#  market     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
