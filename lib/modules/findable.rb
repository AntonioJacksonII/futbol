module Findable

  def all_games_for(num)
    id = num.to_i
    @game_stats.find_all {|game_stat| game_stat.team_id == id}
  end

  def all_games(id)
    number_id = id.to_i
    @games_list.find_all{|game|(game.home_team_id == id) || (game.away_team_id == number_id)}
  end

  def all_games_by_season(id)
    all_games(id).group_by {|game| game.season}
  end

  def games_by_season(season_id, csv_table)
    csv_table.find_all do |game|
      game.game_id.to_s[0..3] == season_id[0..3]
    end
  end

  def coaches_by_season(season)
    season.map {|game| game.head_coach}.uniq
  end

  def team_ids_by_season(season)
    season.map {|game| game.team_id}.uniq
  end

  def team_tackles_by_season(season)
    teams_tackles = {}
    season.each do |game|
      if teams_tackles.any?{teams_tackles[game.team_id]} == false
        teams_tackles[game.team_id] = game.tackles
      else
        teams_tackles[game.team_id] += game.tackles
      end
    end
    teams_tackles
  end

  def team_shots_by_season(season)
    teams_shots = {}
    season.each do |game|
      if teams_shots.any?{teams_shots[game.team_id]} == false
        teams_shots[game.team_id] = game.shots
      else
        teams_shots[game.team_id] += game.shots
      end
    end
    teams_shots
  end

  def team_goals_by_season(season)
    teams_goals = {}
    season.each do |game|
      if teams_goals.any?{teams_goals[game.team_id]} == false
        teams_goals[game.team_id] = game.goals
      else
        teams_goals[game.team_id] += game.goals
      end
    end
    teams_goals
  end

  def team_wins_by_season(season)
    teams_wins = {}
    season.each do |game|
      if teams_wins.any?{teams_wins[game.team_id]} == false && game.result == "WIN"
        teams_wins[game.team_id] = 1
      elsif game.result == "WIN"
        teams_wins[game.team_id] += 1
      end
    end
    teams_wins
  end
end
