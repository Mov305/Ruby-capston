require './src/processor'

def present_options
  puts "Welcome to the Catalogue!

  Choose an option:
  1. List Items
  2. Add a new Book 6
  3. Add a new Music album
  4. Add a new Movie
  5. Add a new Game
  6. List all music albums
  7. List all genres
  8. Add a music album
  6. Exit"
end

def main
  shutdown = false
  until shutdown
    present_options
    option = gets.chomp.to_i
    # handle option
    shutdown = main_processor(option)
  end

  puts 'Thank you for using the Catalogue!'
end
main
