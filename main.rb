require "./src/processor"

def present_options
  puts "Welcome to the Catalogue! 
  
  Choose an option: 
  
  1. List Items
  2. Add a new Book 
  3. Add a new Music album 
  4. Add a new Movie 
  5. Add a new Game 
  6. Exit"
end

def main
  shutdown = false
  while (!shutdown)
    present_options
    option = gets.chomp.to_i
    # handle option
    shutdown = main_processor(option)
  end

  puts "Thank you for using the Catalogue!"
end

main
