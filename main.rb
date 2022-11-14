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
  present_options
  option = gets.chomp.to_i
  if (option == 1)
    puts "List Items 
  1. Books
  2. Music albums
  3. Movies
  4. Games"
    option = gets.chomp.to_i
  end

  puts "Thank you for using the Catalogue!"
end

main
