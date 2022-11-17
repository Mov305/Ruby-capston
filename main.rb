
require "./src/app"

def present_options
  puts "
  Choose an option:

  1. List Items
  2. Add a new Book
  3. Add a new Music album
  4. Add a new Movie
  5. Add a new Game
  6. Exit"
end

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
    puts "Welcome to the Catalog App!"
    shutdown = false
    until shutdown
      present_options
      option = gets.chomp.to_i
      # handle option
      if option.between?(1, 8)
        shutdown = @app.main_processor(option)
      else
        puts "Invalid option"
      end
    end


    puts "Thank you for using the Catalogue!"
  end
end

main = Main.new.run
