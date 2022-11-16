require './Menus/music_menu'
require './Menus/book_menu'
require './Menus/game_menu'

class Main
  def initialize
    @status = true
    @welcome_message = [
      "Welcome to the catalog app!\n",
      'Please choose an option by entering a number:',
      '1 - Book Menu',
      '2 - Music Menu',
      '3 - Games Menu',
      '4 - Exit'
    ]
  end

  def run
    while @status
      @welcome_message.each { |i| puts i }
      option = gets.chomp

      case option
      when '1' then BookMenu.new.run
      when '2' then MusicMenu.new.run
      when '3' then GameMenu.new.run
      when '4'
        puts "Thank you for using this app!\n "
        @status = false
      else
        puts "Sorry, you choose a wrong option\n "
      end
    end
  end
end

main = Main.new
main.run