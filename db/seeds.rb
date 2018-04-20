require 'json'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'data.csv'))
input_hash =  JSON.parse(csv_text)
# stadiums = input_hash['stadiums']
teams = input_hash['teams']
groups = input_hash['groups']

teams.each do |team|
  Team.create(name: team['name'], acronym: team['iso2'])
end

groups.each_pair do |key, _|
  Group.create(name: key)
end

groups.each_pair do |key, _|
  values['matches'].each do |match|
    Match.create(id: match['name'], team_1_id: match['home_team'], team_2_id: match['away_team'], time: match['date'].to_time, description: "round-table #{key}" )

    team = Team.find(match['home_team'])

    if !team.group_id
      team.group_id = Group.where(:name => key).first.id
      team.save
    end
  end
end
