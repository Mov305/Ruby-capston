require_relative "../movie"
require_relative "../source"

class MovieUtiles
  def initialize(store)
    @store = store
  end

  def add_movie
    print "Is the movie silent? (y/n) :"
    silent = gets.chomp.downcase == "y" ? true : false
    print "Enter the publish date of the movie :"
    publish_date = gets.chomp
    movie = Movie.new(silent, publish_date)
    print "Do you want to create a new source to this movie? (y/n) :"
    answer = gets.chomp.downcase
    if answer == "y" || @store.sources.length == 0
      if @store.sources.length == 0
        puts "There are no sources yet please create one"
      end
      source = create_source()
      source.add_item(movie)
      @store.add_source(source)
    else
      source = select_source()
      source.add_item(movie)
      @store.modify_source(source)
    end
    @store.add_movie(movie)
    puts "Movie added successfully"
  end

  def create_source
    print "Enter the name of the source :"
    name = gets.chomp
    source = Source.new(name)
  end

  def select_source
    puts "Select a source"
    @store.sources.each do |source|
      puts "id: #{source.id} - Source name: #{source.name}"
    end
    source_id = gets.chomp.to_i
    source = @store.sources.find { |source| source.id == source_id }
    return source
  end
end