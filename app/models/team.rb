class Team < ApplicationRecord
	belongs_to :group
	has_many :matchs
end
