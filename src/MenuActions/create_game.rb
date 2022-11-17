require_relative '../classes/game'
require_relative '../classes/game_author'

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

  def create_game(games)
    game = Game.new(publish_date, multiplayer, play_date, name_getter)
    author = Author.new(author_getter)
    game.add_author(author)
    games << game
    puts 'Game created successfully.'
    puts ' '
  end
end
