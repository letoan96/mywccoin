require 'json'

csv_text = File.read('db/data.json')
input_hash =  JSON.parse(csv_text)
stadiums = input_hash['stadiums']
teams = input_hash['teams']
groups = input_hash['groups']
flag = input_hash['countryFlags']

teams.each do |team|
  a = Team.create(name: team['name'], acronym: team['iso2'])
end

groups.each_pair do |key, _|
  a = Group.create(name: key)
end

groups.each_pair do |key,value|
  value['matches'].each do |match|
    Match.create(id: match['name'], team_1_id: match['home_team'], team_2_id: match['away_team'], time: match['date'].to_time, description: "round-table #{key}" )
    team = Team.find(match['home_team'])
    if !team.group_id
      team.group_id = Group.where(:name => key).first.id
      team.save
    end
  end
end

flag.each do |tmp|
  url = tmp['flagUrl']
  Flag.create(flagUrl: url)
end