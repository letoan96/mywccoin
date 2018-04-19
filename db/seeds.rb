# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

file = File.read "TeamData32.json"
data = JSON.parse(file) 
data['teams'].each do |tmp|
	teamName = tmp['name']
	Team.create(name: teamName)
end


file = File.read "MatchData64.json"
data = JSON.parse(file)
i = 1
data['fixtures'].each do |data|
	team1 = Team.where(name: data['homeTeamName']).ids.first
	team2 = Team.where(name: data['awayTeamName']).ids.first
	date = data['date']
	puts "#{i} #{date} #{team1} #{team2}"
	Match.create(team_1_id: team1, team_2_id: team2, time: date)
	i+=1
end
