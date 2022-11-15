def main_processor(option)
  case option
  when 1
    puts "List Items
    1. Books
    2. Music albums
    3. Movies
    4. Games"
    option = gets.chomp.to_i
    # handle option

  when 6
    return true
  end
  false
end
