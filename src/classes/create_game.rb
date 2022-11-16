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