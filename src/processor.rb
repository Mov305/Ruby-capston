def main_processor(option)
  if (option == 1)
    puts "List Items 
    1. Books
    2. Music albums
    3. Movies
    4. Games"
    option = gets.chomp.to_i
    # handle option

  elsif (option == 6)
    return true
  else
    # handle the other options
  end
  false
end
