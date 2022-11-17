require 'json'
require_relative 'Book'
require_relative 'label'
require_relative 'genre'


class Store
  def initialize
    @books = []
    @labels = []
    @music = []
    @genre = []
  end

  # rubocop:disable Naming/AccessorMethodName
  def add_book(book)
    json_arr = []
    json_arr = JSON.parse(File.read('Json/book.json')) if File.exist?('Json/book.json')
    json_arr.push(book.map_item)
    @books = json_arr
    file = File.open('Json/book.json', 'w')
    file.write(JSON.pretty_generate(json_arr))
    file.close
  end

  def add_label(label)
    json_arr = []
    json_arr = JSON.parse(File.read('Json/label.json')) if File.exist?('Json/label.json')
    json_arr.push(label.map_item)
    @labels = json_arr
    file = File.open('Json/label.json', 'w')
    file.write(JSON.pretty_generate(json_arr))
    file.close
  end

  def get_books
    jsonArr = []
    jsonArr = JSON.parse(File.read('Json/book.json')) if File.exist?('Json/book.json')
    jsonArr
  end
  
  def get_labels
    jsonArr = []
    jsonArr = JSON.parse(File.read('Json/label.json')) if File.exist?('Json/label.json')
    jsonArr
  end

  def add_music(music)
    json_arr = []
    json_arr = JSON.parse(File.read('Json/music.json')) if File.exist?('Json/music.json')
    json_arr.push(music.map_item)
    @music = json_arr
    file = File.open('Json/music.json', 'w')
    file.write(JSON.pretty_generate(json_arr))
    file.close
  end

  def get_music
    json_arr = []
    json_arr = JSON.parse(File.read('Json/music.json')) if File.exist?('Json/music.json')
    json_arr
  end

  def add_genre(genre)
    json_arr = []
    json_arr = JSON.parse(File.read('Json/genre.json')) if File.exist?('Json/genre.json')
    json_arr.push(genre.map_item)
    @genre = json_arr
    file = File.open('Json/genre.json', 'w')
    file.write(JSON.pretty_generate(json_arr))
    file.close
  end

end
# rubocop:enable Naming/AccessorMethodName

# newItem = Book.new("Publisher", Time.new(2001, 1, 1), "not bad")
# store = Store.new
# store.add_book(newItem)

# lab = Label.new("Title", "red")
# lab.add_item(newItem)
# store.add_label(lab)

# p store.get_books
# p store.get_labels
