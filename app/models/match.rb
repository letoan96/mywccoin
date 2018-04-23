class Match < ApplicationRecord
	belongs_to :team_1, :class_name => 'Team'
	belongs_to :team_2, :class_name => 'Team'

  scope :upcoming_matches, -> { where('time > ?', Time.now ).order('time ASC').limit(4)}
end
