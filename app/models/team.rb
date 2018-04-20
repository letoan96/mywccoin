class Team < ApplicationRecord
	belongs_to :group, optional: true
	has_many :matchs
end
