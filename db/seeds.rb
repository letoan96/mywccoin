# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'csv'
csv_text = File.read(Rails.root.join('config', 'data', 'data.json'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
input_hash =  JSON.parse(csv_text)
stadiums = input_hash['stadiums']
teams = input_hash['teams']
groups = input_hash['groups']
puts seed teams
teams.each do |team|
  a = Team.create(name: team['name'], acronym: team['iso2'])
end
puts seed groups
groups.each_pair do |key,values|
  a = Group.create(name: key)
end
puts seed matchs
groups.each_pair do |key,values|
  values['matches'].each do |match|
    Match.create(id: match['name'], team_1_id: match['home_team'], team_2_id: match['away_team'], time: match['date'].to_time, description: "round-table #{key}" )
    team = Team.find(match['home_team'])
    if !team.group_id
      team.group_id = Group.where(:name => key).first.id
      team.save
    end
  end
end

 