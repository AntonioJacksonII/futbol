class Game
  attr_reader :game_id, :season, :type, :away_team_id, :home_team_id, :away_goals, :home_goals
  def initialize(info)

    @game_id= info[:game_id].to_i
    @season= info[:season]
    @type= info[:type]
    @home_goals= info[:home_goals]
    @away_team_id= info[:away_team_id].to_i
    @home_team_id= info[:home_team_id].to_i
    @away_goals= info[:away_goals].to_i
    @home_goals= info[:home_goals].to_i
  end

  #created the two methods to help get the number of games won in a season for team stats
  def home_team_win?
    home_goals > away_goals
  end

  def visitor_team_win?
    home_goals < away_goals
  end
end
