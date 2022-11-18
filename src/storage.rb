require 'json'
require_relative 'Book'
require_relative 'label'
require_relative 'genre'
require_relative 'music_album'
require_relative 'movie'
require_relative 'source'
require_relative 'game'
require_relative 'author'

class Store
  def initialize
    @books = if File.exist?('Json/book.json')
               JSON.parse(File.read('Json/book.json')).map do |book|
                 Book.new(book['publisher'], book['publish_date'], book['cover_state'],
                          book['id'])
               end
             else
               []
             end
    @labels = if File.exist?('Json/label.json')
                JSON.parse(File.read('Json/label.json')).map do |label|
                  Label.new(label['title'], label['color'], label['id'])
                end
              else
                []
              end
    @musics = if File.exist?('Json/music.json')
                JSON.parse(File.read('Json/music.json')).map do |music|
                  MusicAlbum.new(music['publish_date'], music['on_spotify'],
                                 music['title'], music['id'])
                end
              else
                []
              end
    @genres = if File.exist?('Json/genre.json')
                JSON.parse(File.read('Json/genre.json')).map do |genre|
                  Genre.new(genre['name'], genre['id'])
                end
              else
                []
              end
    @movies = if File.exist?('Json/movie.json')
                JSON.parse(File.read('Json/movie.json')).map do |movie|
                  Movie.new(movie['silent'], movie['publish_date'],
                            movie['id'])
                end
              else
                []
              end
    @sources = if File.exist?('Json/source.json')
                 JSON.parse(File.read('Json/source.json')).map do |source|
                   Source.new(source['name'], source['id'])
                 end
               else
                 []
               end
    @games = if File.exist?('Json/game.json')
               JSON.parse(File.read('Json/game.json')).map do |game|
                 Game.new(game['mutiplayer'], game['last_played_at'],
                          game['id'])
               end
             else
               []
             end
    @authors = if File.exist?('Json/author.json')
                 JSON.parse(File.read('Json/author.json')).map do |author|
                   Author.new(author['first_name'], author['last_name'],
                              author['id'])
                 end
               else
                 []
               end
  end

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

  def add_game(game)
    @games << game
  end

  def add_author(author)
    @authors << author
  end

  def modify_author(author)
    @authors = @authors.map { |a| a.id == author.id ? author : a }
  end

  def save_data
    # if Json folder doesn't exist, create it
    Dir.mkdir('Json') unless Dir.exist?('Json')
    # rubocop:disable Style/GuardClause
    if Dir.exist?('Json')
      # rubocop:enable Style/GuardClause
      File.write('Json/book.json', JSON.pretty_generate(@books.map(&:map_item)))
      File.write('Json/label.json', JSON.pretty_generate(@labels.map(&:map_item)))
      File.write('Json/music.json', JSON.pretty_generate(@musics.map(&:map_item)))
      File.write('Json/genre.json', JSON.pretty_generate(@genres.map(&:map_item)))
      File.write('Json/movie.json', JSON.pretty_generate(@movies.map(&:map_item)))
      File.write('Json/source.json', JSON.pretty_generate(@sources.map(&:map_item)))
      File.write('Json/game.json', JSON.pretty_generate(@games.map(&:map_item)))
      File.write('Json/author.json', JSON.pretty_generate(@authors.map(&:map_item)))
    end
  end

  attr_reader :books, :labels, :musics, :genres, :movies, :sources, :games, :authors
end
