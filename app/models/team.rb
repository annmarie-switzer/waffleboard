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
class Team < ApplicationRecord
  has_many :players
  has_many :games
end
