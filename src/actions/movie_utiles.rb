require_relative '../movie'
require_relative '../source'

class MovieUtiles
  def initialize(store)
    @store = store
  end

  def add_movie
    print 'Is the movie silent? (y/n) :'
    silent = gets.chomp.downcase == 'y'
    print 'Enter the publish date of the movie :'
    publish_date = gets.chomp.split('-').map(&:to_i)
    movie = Movie.new(silent, Time.new(publish_date[0], publish_date[1], publish_date[2]))
    print 'Do you want to create a new source to this movie? (y/n) :'
    answer = gets.chomp.downcase
    if answer == 'y' || @store.sources.length.zero?
      puts 'There are no sources yet please create one' if @store.sources.length.zero?
      source = create_source
      source.add_item(movie)
      @store.add_source(source)
    else
      source = select_source
      source.add_item(movie)
      @store.modify_source(source)
    end
    @store.add_movie(movie)
    puts 'Movie added successfully'
  end

  def create_source
    print 'Enter the name of the source :'
    name = gets.chomp
    Source.new(name)
  end

  def select_source
    puts 'Select a source'
    @store.sources.each do |source|
      puts "id: #{source.id} - Source name: #{source.name}"
    end
    source_id = gets.chomp.to_i
    @store.sources.find { |source| source.id == source_id }
  end
end
