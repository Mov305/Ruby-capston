require './Classes/game'
require './Classes/game_author'

class CreateGame
  def name_getter
    print('Enter the game name: ')
    gets.chomp
  end
  def author_getter
    print('Enter the author: ')
    gets.chomp
  end
  def multiplayer
    print('Is this game a Multiplayer(Y/N): ')
    player_method = gets.chomp.downcase
    player_method == 'y'
  end

  def play_date
    print('Enter the last played date (YYYY-MM-DD): ')
    gets.chomp
  end

  def publish_date
    print('Enter the publish date (YYYY-MM-DD): ')
    gets.chomp
  end  