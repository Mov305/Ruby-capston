require "json"
require_relative "Book"
require_relative "label"
require_relative "genre"
require_relative "music_album"
require_relative "movie"
require_relative "source"

class Store
  def initialize
    @books = File.exist?("Json/book.json") ? JSON.parse(File.read("Json/book.json")).map { |book| Book.new(book["publisher"], book["publish_date"], book["cover_state"], book["id"]) } : []
    @labels = File.exist?("Json/label.json") ? JSON.parse(File.read("Json/label.json")).map { |label| Label.new(label["title"], label["color"], label["id"]) } : []
    @musics = File.exist?("Json/music.json") ? JSON.parse(File.read("Json/music.json")).map { |music| MusicAlbum.new(music["publish_date"], music["on_spotify"], music["title"], music["id"]) } : []
    @genres = File.exist?("Json/genre.json") ? JSON.parse(File.read("Json/genre.json")).map { |genre| Genre.new(genre["name"], genre["id"]) } : []
    @movies = File.exist?("Json/movie.json") ? JSON.parse(File.read("Json/movie.json")).map { |movie| Movie.new(movie["title"], movie["publish_date"], movie["on_netflix"], movie["id"]) } : []
    @sources = File.exist?("Json/source.json") ? JSON.parse(File.read("Json/source.json")).map { |source| Source.new(source["name"], source["id"]) } : []
  end

  # rubocop:disable Naming/AccessorMethodName
  def add_book(book)
    @books << book
  end

  def add_label(label)
    @labels << label
  end

  def modify_label(label)
    @labels = @labels.map { |l| l.id == label.id ? label : l }
  end

  def add_music(music)
    @musics << music
  end

  def add_genre(genre)
    @genres << genre
  end

  def modify_genre(genre)
    @genres = @genres.map { |g| g.id == genre.id ? genre : g }
  end

  def add_movie(movie)
    @movies << movie
  end

  def add_source(source)
    @sources << source
  end

  def modify_source(source)
    @sources = @sources.map { |s| s.id == source.id ? source : s }
  end

  def save_data
    File.write("Json/book.json", JSON.pretty_generate(@books.map { |book| book.map_item }))
    File.write("Json/label.json", JSON.pretty_generate(@labels.map { |label| label.map_item }))
    File.write("Json/music.json", JSON.pretty_generate(@musics.map { |music| music.map_item }))
    File.write("Json/genre.json", JSON.pretty_generate(@genres.map { |genre| genre.map_item }))
    File.write("Json/movie.json", JSON.pretty_generate(@movies.map { |movie| movie.map_item }))
    File.write("Json/source.json", JSON.pretty_generate(@sources.map { |source| source.map_item }))
  end

  attr_reader :books, :labels, :musics, :genres, :movies, :sources
end

# rubocop:enable Naming/AccessorMethodName

# newItem = Book.new("Publisher", Time.new(2001, 1, 1), "not bad")
# store = Store.new
# store.add_book(newItem)
# store.save_data

# p store.books

# lab = Label.new("Title", "red")
# lab.add_item(newItem)
# store.add_label(lab)

# p store.get_books
# p store.get_labels
