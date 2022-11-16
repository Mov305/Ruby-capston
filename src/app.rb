require_relative 'utiles'
require_relative 'storage'
require_relative 'movie'

class App
  def initialize
    @store = Store.new
    @books_list = @store.get_books
    @labels_list = @store.get_labels
  end

  def sub_processor(option)
    case option
    when 1
      @store.get_books.each do |book|
        puts "Id: #{book['id']} Book title: #{book['title']} - Book author: #{book['author']} - Book publisher: #{book['publisher']} - Book date: #{book['date']} - Book cover state: #{book['cover_state']}"
      end
    when 2
      puts 'Music albums'
    when 3
      puts 'Movies'
    when 4
      puts 'Games'
    when 5
      @store.get_labels.each do |label|
        puts "id: #{label['id']} - Label title: #{label['title']} - Label color: #{label['color']}"
      end
    else
      puts 'Invalid option'
    end
  end

  def main_processor(option)
    case option
    when 1
      puts "List Items
    1. Books
    2. Music albums
    3. Movies
    4. Games
    5. Labels"

      sub_option = gets.chomp.to_i
      # handle option
      sub_processor(sub_option)
    when 7
      return true
    else
      # handle the other options
      case option
      when 2
        add_book(@store)
      when 3
        puts 'Add a new Music album'
      when 4
        puts 'Add a new Movie'
      when 5
        puts 'Add a new Game'
      when 6
        add_label(@store)
      else
        puts 'Invalid option'
      end
    end
    false
  end
end