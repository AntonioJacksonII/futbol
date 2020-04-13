require_relative 'test_helper'
require './lib/game_collection'
require './lib/game'

class GameCollectionClass < Minitest::Test
  def setup
    file_path = './test/fixtures/truncated_games.csv'
    @game_collection = GameCollection.new(file_path)
  end

  def test_it_exists
    assert_instance_of GameCollection, @game_collection
  end

  def test_it_has_list_of_games
  assert_instance_of Array, @game_collection.games_list
  assert_instance_of Game, @game_collection.games_list.first
  assert_equal 18, @game_collection.games_list.length
  end

  def test_can_find_games
    assert_equal 18, @game_collection.all_games(5).count
  end

#   def test_can_sort_games_by_season
#   skip
#   game1 = mock('game 1')
#   game2 = mock('game 2')
#   game3 = mock('game 3')
#
#   @game_collection.stubs(:all_games).returns([game1, game2, game3])
#   #{season => [game1, game2], season => [game2, game3]}
#   assert_equal 2, @game_collection.all_games_by_season(5)
# end

  def test_can_count_games_by_season
    expected = {"20122013"=>11, "20152016"=>3, "20142015"=>4}
    assert_equal expected, @game_collection.total_games_per_season(5)
  end

  def test_can_count_all_wins_in_season
    expected = {"20122013"=>5, "20152016"=>3, "20142015"=>0}
    assert_equal expected, @game_collection.wins_in_season(5)
  end

  def test_can_calculate_win_percentage
    expected = {"20122013"=>45.0, "20152016"=>100.0, "20142015"=>0.0}
    assert_equal expected, @game_collection.win_percentage(5)
  end

  def test_can_find_best_season
    assert_equal "20152016", @game_collection.best_season(5)
  end

  def test_can_find_worst_season
    assert_equal "20142015", @game_collection.worst_season(5)
  end

  # def test_can_get_opponent_stats
#   skip
#   #mocks and stubs
#   #{id => [game], id => [games]}
#   assert_equal 3, @game_collection.opponent_stats(5)
# end

  def test_can_count_all_games_played_with_opponent
    expected = {9=>5, 13=>1, 1=>1, 3=>8, 8=>1, 2=>2}
    assert_equal expected, @game_collection.opponent_total_games_played(5)
  end

  def test_can_count_opponent_wins
    expected = {9=>2, 13=>1, 1=>1, 3=>5, 8=>0, 2=>1}
    assert_equal expected, @game_collection.opponent_wins(5)
  end

  def test_can_get_opponent_win_percentage
    expected = {9=>40.0, 13=>100.0, 1=>100.0, 3=>63.0, 8=>0.0, 2=>50.0}
    assert_equal expected, @game_collection.opponent_win_percentage(5)
  end

  def test_can_get_favorite_opponent
    assert_equal 8, @game_collection.favorite_opponent_id(5)
  end

  def test_can_get_rival
    assert_equal 13, @game_collection.rival_id(5)
  end
end
